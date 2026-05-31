"""FSML language server.

Run with:
    python -m fsml_lsp.server
"""
from __future__ import annotations

from typing import Optional

from lsprotocol import types as lsp
from pygls.server import LanguageServer

from .analysis import (
    AnalysisResult,
    Position,
    Severity,
    analyze,
    completion_context,
    format_fsml,
    state_at,
    state_definition_at,
    transition_at,
)


class FsmlLanguageServer(LanguageServer):
    def __init__(self) -> None:
        super().__init__("fsml-lsp", "0.1.0")
        self._analysis_cache: dict[str, AnalysisResult] = {}

    def analyze_document(self, uri: str) -> AnalysisResult:
        document = self.workspace.get_text_document(uri)
        text = document.source
        cached = self._analysis_cache.get(uri)
        if cached and cached.text == text:
            return cached
        result = analyze(text)
        self._analysis_cache[uri] = result
        return result


server = FsmlLanguageServer()


def _range(rng) -> lsp.Range:
    return lsp.Range(
        start=lsp.Position(line=rng.start.line, character=rng.start.character),
        end=lsp.Position(line=rng.end.line, character=rng.end.character),
    )


def _position(pos: lsp.Position) -> Position:
    return Position(pos.line, pos.character)


def _severity(severity: Severity) -> lsp.DiagnosticSeverity:
    return {
        Severity.ERROR: lsp.DiagnosticSeverity.Error,
        Severity.WARNING: lsp.DiagnosticSeverity.Warning,
        Severity.INFO: lsp.DiagnosticSeverity.Information,
    }[severity]


def publish_diagnostics(ls: FsmlLanguageServer, uri: str) -> None:
    result = ls.analyze_document(uri)
    diagnostics = [
        lsp.Diagnostic(
            range=_range(diag.range),
            message=diag.message,
            severity=_severity(diag.severity),
            source="fsml",
            code=diag.code,
        )
        for diag in result.diagnostics
    ]
    ls.publish_diagnostics(uri, diagnostics)


@server.feature(lsp.TEXT_DOCUMENT_DID_OPEN)
def did_open(ls: FsmlLanguageServer, params: lsp.DidOpenTextDocumentParams) -> None:
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DID_CHANGE)
def did_change(ls: FsmlLanguageServer, params: lsp.DidChangeTextDocumentParams) -> None:
    ls._analysis_cache.pop(params.text_document.uri, None)
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DID_SAVE)
def did_save(ls: FsmlLanguageServer, params: lsp.DidSaveTextDocumentParams) -> None:
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DOCUMENT_SYMBOL)
def document_symbol(ls: FsmlLanguageServer, params: lsp.DocumentSymbolParams):
    result = ls.analyze_document(params.text_document.uri)
    symbols = []
    for state in result.states:
        children = [
            lsp.DocumentSymbol(
                name=f"{tr.event}{' / ' + tr.action if tr.action else ''}{' -> ' + tr.target if tr.target else ''}",
                kind=lsp.SymbolKind.Event,
                range=_range(tr.range),
                selection_range=_range(tr.event_range),
            )
            for tr in state.transitions
        ]
        symbols.append(
            lsp.DocumentSymbol(
                name=state.name,
                detail="initial state" if state.initial else "state",
                kind=lsp.SymbolKind.Class,
                range=_range(state.range),
                selection_range=_range(state.name_range),
                children=children,
            )
        )
    return symbols


@server.feature(lsp.TEXT_DOCUMENT_DEFINITION)
def definition(ls: FsmlLanguageServer, params: lsp.DefinitionParams):
    uri = params.text_document.uri
    result = ls.analyze_document(uri)
    state = state_definition_at(result, _position(params.position))
    if not state:
        return None
    return lsp.Location(uri=uri, range=_range(state.name_range))


@server.feature(lsp.TEXT_DOCUMENT_HOVER)
def hover(ls: FsmlLanguageServer, params: lsp.HoverParams):
    result = ls.analyze_document(params.text_document.uri)
    pos = _position(params.position)
    state = state_at(result, pos)
    transition = transition_at(result, pos)
    if transition:
        contents = f"event `{transition.event}`"
        if transition.action:
            contents += f", action `{transition.action}`"
        contents += f", target `{transition.target or state.name if state else '<self>'}`"
        return lsp.Hover(contents=lsp.MarkupContent(kind=lsp.MarkupKind.Markdown, value=contents), range=_range(transition.range))
    if state and state.name_range.contains(pos):
        incoming = sum(1 for s in result.states for tr in s.transitions if tr.target == state.name)
        contents = (
            f"**State `{state.name}`**\n\n"
            f"Initial: {'yes' if state.initial else 'no'}\n\n"
            f"Outgoing transitions: {len(state.transitions)}\n\n"
            f"Incoming transitions: {incoming}"
        )
        return lsp.Hover(contents=lsp.MarkupContent(kind=lsp.MarkupKind.Markdown, value=contents), range=_range(state.name_range))
    return None


@server.feature(lsp.TEXT_DOCUMENT_COMPLETION)
def completion(ls: FsmlLanguageServer, params: lsp.CompletionParams):
    result = ls.analyze_document(params.text_document.uri)
    context = completion_context(result.text, _position(params.position))
    if context == "target":
        return [
            lsp.CompletionItem(label=name, kind=lsp.CompletionItemKind.Reference)
            for name in sorted(result.state_declarations)
        ]
    return [
        lsp.CompletionItem(label="initial", kind=lsp.CompletionItemKind.Keyword),
        lsp.CompletionItem(label="state", kind=lsp.CompletionItemKind.Keyword),
    ]


@server.feature(lsp.TEXT_DOCUMENT_FORMATTING)
def formatting(ls: FsmlLanguageServer, params: lsp.DocumentFormattingParams):
    result = ls.analyze_document(params.text_document.uri)
    formatted = format_fsml(result)
    last_line = result.text.count("\n")
    last_char = len(result.text.rsplit("\n", 1)[-1])
    whole_document = lsp.Range(
        start=lsp.Position(line=0, character=0),
        end=lsp.Position(line=last_line, character=last_char),
    )
    return [lsp.TextEdit(range=whole_document, new_text=formatted)]


@server.feature(lsp.TEXT_DOCUMENT_CODE_ACTION)
def code_action(ls: FsmlLanguageServer, params: lsp.CodeActionParams):
    result = ls.analyze_document(params.text_document.uri)
    actions = []
    for diag in params.context.diagnostics:
        if diag.code == "unresolved-target":
            name = diag.message.split("'")[1]
            insertion = f"\nstate {name} {{\n}}\n"
            edit = lsp.WorkspaceEdit(
                changes={
                    params.text_document.uri: [
                        lsp.TextEdit(
                            range=lsp.Range(
                                start=lsp.Position(line=result.text.count("\n") + 1, character=0),
                                end=lsp.Position(line=result.text.count("\n") + 1, character=0),
                            ),
                            new_text=insertion,
                        )
                    ]
                }
            )
            actions.append(
                lsp.CodeAction(
                    title=f"Create state '{name}'",
                    kind=lsp.CodeActionKind.QuickFix,
                    diagnostics=[diag],
                    edit=edit,
                )
            )
    return actions


def main() -> None:
    server.start_io()


if __name__ == "__main__":
    main()
