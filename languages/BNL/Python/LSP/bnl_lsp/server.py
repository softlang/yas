"""BNL language server.

Run with:
    python -m bnl_lsp.server
"""

from __future__ import annotations

import re
from lsprotocol import types as lsp
from pygls.server import LanguageServer

from .analysis import (
    AnalysisResult,
    Position,
    Severity,
    analyze,
    word_at, parse_binary,
)


class BnlLanguageServer(LanguageServer):
    def __init__(self) -> None:
        super().__init__("bnl-lsp", "0.1.0")
        self._cache: dict[str, AnalysisResult] = {}

    def analyze_document(self, uri: str) -> AnalysisResult:
        text = self.workspace.get_text_document(uri).source
        cached = self._cache.get(uri)
        if cached and cached.text == text:
            return cached
        result = analyze(text)
        self._cache[uri] = result
        return result


server = BnlLanguageServer()


def _range(rng) -> lsp.Range:
    return lsp.Range(
        start=lsp.Position(line=rng.start.line, character=rng.start.character),
        end=lsp.Position(line=rng.end.line, character=rng.end.character),
    )


def _position(pos: lsp.Position) -> Position:
    return Position(pos.line, pos.character)


_SEVERITY = {
    Severity.ERROR: lsp.DiagnosticSeverity.Error,
    Severity.WARNING: lsp.DiagnosticSeverity.Warning,
    Severity.INFO: lsp.DiagnosticSeverity.Information,
}


def publish_diagnostics(ls: BnlLanguageServer, uri: str) -> None:
    result = ls.analyze_document(uri)
    ls.publish_diagnostics(
        uri,
        [
            lsp.Diagnostic(
                range=_range(diag.range),
                message=diag.message,
                severity=_SEVERITY[diag.severity],
                source="bnl",
                code=diag.code,
            )
            for diag in result.diagnostics
        ],
    )


@server.feature(lsp.TEXT_DOCUMENT_DID_OPEN)
def did_open(ls: BnlLanguageServer, params: lsp.DidOpenTextDocumentParams) -> None:
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DID_CHANGE)
def did_change(ls: BnlLanguageServer, params: lsp.DidChangeTextDocumentParams) -> None:
    ls._cache.pop(params.text_document.uri, None)
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DID_SAVE)
def did_save(ls: BnlLanguageServer, params: lsp.DidSaveTextDocumentParams) -> None:
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_HOVER)
def hover(ls: BnlLanguageServer, params: lsp.HoverParams):
    result = ls.analyze_document(params.text_document.uri)
    pos = _position(params.position)
    word = word_at(result.text, pos)
    if word and re.fullmatch(r"[01]+(\.[01]+)?", word):
        binary_val = parse_binary(word)
        if binary_val is not None:
            return lsp.Hover(
                contents=lsp.MarkupContent(
                    kind=lsp.MarkupKind.Markdown,
                    value=f"**Binary number `{word}`**\n\nDecimal value: {binary_val}",
                ))
    return None


@server.feature(lsp.TEXT_DOCUMENT_COMPLETION)
def completion(ls: BnlLanguageServer, params: lsp.CompletionParams):
    text = ls.workspace.get_text_document(params.text_document.uri).source
    stripped = text.strip()
    keywords = ["0", "1", "."]
    lines = text.splitlines()
    cursor_line = lines[params.position.line] if params.position.line < len(lines) else ""
    if ((any(c in text for c in keywords) and "\n" in stripped) or " " in stripped or (
            stripped and text.rstrip("\r\n") != text.rstrip())
            or (stripped and not cursor_line.strip())):
        return None
    if "." in stripped or not stripped or any(c in "01." for c in cursor_line[params.position.character:]):
        keywords.remove(".")
    before = cursor_line[:params.position.character]
    prefix = before.lstrip()
    if prefix and not re.fullmatch(r"[01]+\.?[01]*", prefix):
        return None
    start = lsp.Position(line=params.position.line, character=len(before) - len(prefix))
    return [
        lsp.CompletionItem(label=kw, kind=lsp.CompletionItemKind.Keyword,
                           documentation=kw, filter_text=prefix + kw,
                           text_edit=lsp.TextEdit(range=lsp.Range(start=start, end=params.position),
                                                  new_text=prefix + kw))
        for kw in keywords
    ]


@server.feature(lsp.TEXT_DOCUMENT_FORMATTING)
def formatting(ls: BnlLanguageServer, params: lsp.DocumentFormattingParams):
    text = ls.workspace.get_text_document(params.text_document.uri).source
    formatted = text.strip() + "\n"
    lines = text.split("\n")
    whole_document = lsp.Range(
        start=lsp.Position(line=0, character=0),
        end=lsp.Position(line=len(lines) - 1, character=len(lines[-1])),
    )
    return [lsp.TextEdit(range=whole_document, new_text=formatted)]


@server.feature(lsp.TEXT_DOCUMENT_CODE_ACTION)
def code_action(ls: BnlLanguageServer, params: lsp.CodeActionParams):
    actions = []
    text = ls.workspace.get_text_document(params.text_document.uri).source
    if not text.strip():
        return [lsp.CodeAction(
            title="Insert 0",
            kind=lsp.CodeActionKind.QuickFix,
            diagnostics=list(params.context.diagnostics),
            is_preferred=True,
            edit=lsp.WorkspaceEdit(changes={
                params.text_document.uri: [lsp.TextEdit(
                    range=lsp.Range(start=lsp.Position(line=0, character=0),
                                    end=lsp.Position(line=0, character=0)),
                    new_text="0",
                )]
            }),
        )]
    for diag in params.context.diagnostics:
        # Dont remove for unfinished binaries like "1."
        if diag.range.start == diag.range.end:
            continue
        actions.append(lsp.CodeAction(
            title="Remove invalid input",
            kind=lsp.CodeActionKind.QuickFix,
            diagnostics=[diag],
            edit=lsp.WorkspaceEdit(changes={
                params.text_document.uri: [lsp.TextEdit(
                    range=diag.range,
                    new_text="",
                )]
            }),
        ))
    return actions


def main() -> None:
    server.start_io()


if __name__ == "__main__":
    main()
