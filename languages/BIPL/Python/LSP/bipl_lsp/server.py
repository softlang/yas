"""BIPL language server.

Run with:
    python -m bipl_lsp.server
"""
from __future__ import annotations

from lsprotocol import types as lsp
from pygls.server import LanguageServer

from .analysis import (
    AnalysisResult,
    Position,
    Severity,
    analyze,
    occurrence_at,
    word_at,
)

KEYWORD_DOCS = {
    "if": "`if ( expr ) stmt { else stmt }?` — conditional statement; "
          "the condition must be boolean.",
    "else": "Optional alternative branch of an `if` statement.",
    "while": "`while ( expr ) stmt` — loop statement; "
             "the condition must be boolean.",
}


class BiplLanguageServer(LanguageServer):
    def __init__(self) -> None:
        super().__init__("bipl-lsp", "0.1.0")
        self._cache: dict[str, AnalysisResult] = {}

    def analyze_document(self, uri: str) -> AnalysisResult:
        text = self.workspace.get_text_document(uri).source
        cached = self._cache.get(uri)
        if cached and cached.text == text:
            return cached
        result = analyze(text)
        self._cache[uri] = result
        return result


server = BiplLanguageServer()


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


def publish_diagnostics(ls: BiplLanguageServer, uri: str) -> None:
    result = ls.analyze_document(uri)
    ls.publish_diagnostics(uri, [
        lsp.Diagnostic(
            range=_range(diag.range),
            message=diag.message,
            severity=_SEVERITY[diag.severity],
            source="bipl",
            code=diag.code,
        )
        for diag in result.diagnostics
    ])


@server.feature(lsp.TEXT_DOCUMENT_DID_OPEN)
def did_open(ls: BiplLanguageServer, params: lsp.DidOpenTextDocumentParams) -> None:
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DID_CHANGE)
def did_change(ls: BiplLanguageServer, params: lsp.DidChangeTextDocumentParams) -> None:
    ls._cache.pop(params.text_document.uri, None)
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_DID_SAVE)
def did_save(ls: BiplLanguageServer, params: lsp.DidSaveTextDocumentParams) -> None:
    publish_diagnostics(ls, params.text_document.uri)


@server.feature(lsp.TEXT_DOCUMENT_HOVER)
def hover(ls: BiplLanguageServer, params: lsp.HoverParams):
    result = ls.analyze_document(params.text_document.uri)
    pos = _position(params.position)
    occ = occurrence_at(result, pos)
    if occ:
        info = result.variables[occ.name]
        lines = [f"**Variable `{info.name}`**", ""]
        lines.append(f"Inferred type: `{info.type or 'unknown'}`")
        if info.is_input:
            lines.append("\nNever assigned — treated as a *program input* "
                         "(BIPL programs read inputs from the initial store).")
        lines.append(f"\nAssignments: {info.assignments} — Reads: {info.reads}")
        return lsp.Hover(
            contents=lsp.MarkupContent(kind=lsp.MarkupKind.Markdown,
                                       value="\n".join(lines)),
            range=_range(occ.range),
        )
    word = word_at(result.text, pos)
    if word in KEYWORD_DOCS:
        return lsp.Hover(contents=lsp.MarkupContent(
            kind=lsp.MarkupKind.Markdown, value=KEYWORD_DOCS[word]))
    return None


@server.feature(lsp.TEXT_DOCUMENT_DEFINITION)
def definition(ls: BiplLanguageServer, params: lsp.DefinitionParams):
    uri = params.text_document.uri
    result = ls.analyze_document(uri)
    occ = occurrence_at(result, _position(params.position))
    if not occ:
        return None
    defn = result.variables[occ.name].definition
    return lsp.Location(uri=uri, range=_range(defn)) if defn else None


@server.feature(lsp.TEXT_DOCUMENT_REFERENCES)
def references(ls: BiplLanguageServer, params: lsp.ReferenceParams):
    uri = params.text_document.uri
    result = ls.analyze_document(uri)
    occ = occurrence_at(result, _position(params.position))
    if not occ:
        return None
    return [
        lsp.Location(uri=uri, range=_range(o.range))
        for o in result.variables[occ.name].occurrences
    ]


@server.feature(lsp.TEXT_DOCUMENT_RENAME)
def rename(ls: BiplLanguageServer, params: lsp.RenameParams):
    uri = params.text_document.uri
    result = ls.analyze_document(uri)
    occ = occurrence_at(result, _position(params.position))
    if not occ:
        return None
    new_name = params.new_name
    if not (new_name and (new_name[0].isalpha() or new_name[0] == "_")
            and all(c.isalnum() or c == "_" for c in new_name)
            and new_name not in ("if", "else", "while")):
        raise ValueError(f"{new_name!r} is not a valid BIPL identifier")
    edits = [
        lsp.TextEdit(range=_range(o.range), new_text=new_name)
        for o in result.variables[occ.name].occurrences
    ]
    return lsp.WorkspaceEdit(changes={uri: edits})


@server.feature(lsp.TEXT_DOCUMENT_COMPLETION)
def completion(ls: BiplLanguageServer, params: lsp.CompletionParams):
    result = ls.analyze_document(params.text_document.uri)
    items = [
        lsp.CompletionItem(label=kw, kind=lsp.CompletionItemKind.Keyword,
                           documentation=KEYWORD_DOCS[kw])
        for kw in ("if", "else", "while")
    ]
    for info in sorted(result.variables.values(), key=lambda v: v.name):
        items.append(lsp.CompletionItem(
            label=info.name,
            kind=lsp.CompletionItemKind.Variable,
            detail=f"{info.type or 'unknown'}"
                   + (" (input)" if info.is_input else ""),
        ))
    return items


@server.feature(lsp.TEXT_DOCUMENT_DOCUMENT_SYMBOL)
def document_symbol(ls: BiplLanguageServer, params: lsp.DocumentSymbolParams):
    result = ls.analyze_document(params.text_document.uri)
    symbols = []
    for info in sorted(result.variables.values(), key=lambda v: v.name):
        defn = info.definition
        if not defn:
            continue
        symbols.append(lsp.DocumentSymbol(
            name=info.name,
            detail=f"{info.type or 'unknown'}"
                   + (", program input" if info.is_input else ""),
            kind=lsp.SymbolKind.Variable,
            range=_range(defn),
            selection_range=_range(defn),
        ))
    return symbols


@server.feature(lsp.TEXT_DOCUMENT_CODE_ACTION)
def code_action(ls: BiplLanguageServer, params: lsp.CodeActionParams):
    result = ls.analyze_document(params.text_document.uri)
    actions = []
    for diag in params.context.diagnostics:
        if diag.code != "maybe-uninitialized":
            continue
        name = diag.message.split("'")[1]
        first_brace = result.text.find("{")
        if first_brace == -1:
            continue
        line = result.text.count("\n", 0, first_brace)
        insert_at = lsp.Position(line=line + 1, character=0)
        actions.append(lsp.CodeAction(
            title=f"Initialize '{name}' to 0 at the start of the program",
            kind=lsp.CodeActionKind.QuickFix,
            diagnostics=[diag],
            edit=lsp.WorkspaceEdit(changes={
                params.text_document.uri: [lsp.TextEdit(
                    range=lsp.Range(start=insert_at, end=insert_at),
                    new_text=f"  {name} = 0;\n",
                )]
            }),
        ))
    return actions


def main() -> None:
    server.start_io()


if __name__ == "__main__":
    main()
