# FSML LSP Demo

This directory contains a small Language Server Protocol (LSP) demonstration for the Finite State Machine Language (FSML) case study in `languages/FSML`.

The existing Python implementation in `languages/FSML/Python` uses an ANTLR grammar and generated Python sources. This demo sits beside it in `languages/FSML/Python/LSP` and mirrors the same small FSML grammar with a Python 3 analyzer so that the LSP demo is easy to build and run with modern tooling.

The analyzer is intentionally factored behind `fsml_lsp.analysis.analyze(text)`. If desired, that function can later be replaced by an adapter around the existing ANTLR parser while keeping the LSP server unchanged.

## Features

Implemented LSP features:

- syntax diagnostics
- semantic diagnostics
  - duplicate states
  - missing or multiple initial states
  - duplicate events inside a state
  - unresolved transition targets
  - unreachable states
- document symbols for states and transitions
- go to definition for state references
- hover for states and transitions
- completion
  - `initial` and `state` at top level
  - declared state names after `->`
- document formatting
- quick fix for unresolved target states: create a missing state

## Layout

```text
languages/FSML/Python/LSP/
  fsml_lsp/
    analysis.py       # parser, symbol table, semantic checks, formatter
    server.py         # pygls-based language server
  examples/
    good.fsml
    bad.fsml
  tests/
    test_analysis.py
  vscode/
    package.json      # minimal VS Code client
    src/extension.ts
  pyproject.toml
  README.md
```

## Build and test the server

From this directory:

```bash
cd languages/FSML/Python/LSP
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -e '.[test]'
pytest
```

Run the language server on stdio:

```bash
fsml-lsp
```

or:

```bash
python -m fsml_lsp.server
```

Normally, users do not start the server manually. An editor client starts it and talks LSP over stdin/stdout.

## Try the analyzer without an editor

```bash
python - <<'PY'
from pathlib import Path
from fsml_lsp.analysis import analyze

text = Path('examples/bad.fsml').read_text()
result = analyze(text)
for diagnostic in result.diagnostics:
    print(f'{diagnostic.severity}: {diagnostic.message} at {diagnostic.range.start.line + 1}:{diagnostic.range.start.character + 1}')
PY
```

Expected output includes unresolved target, duplicate event, missing semicolon, and unreachable-state diagnostics.

## VS Code demo client

The `vscode` folder contains a minimal VS Code extension that starts the Python language server for files ending in `.fsml`.

Install client dependencies:

```bash
cd languages/FSML/Python/LSP/vscode
npm install
npm run compile
```

Open the `vscode` folder in VS Code and press `F5` to launch an Extension Development Host.

In the Extension Development Host:

1. Open `languages/FSML/Python/LSP/examples/good.fsml`.
2. Try completion after `->`.
3. Ctrl-click a target state such as `unlocked`.
4. Hover over a state name.
5. Format the document.
6. Open `examples/bad.fsml` and inspect diagnostics.
7. Use the quick fix on `unloked` to create the missing state.

The extension assumes the server command `fsml-lsp` is available on `PATH`. The easiest way is to start VS Code from a shell where the virtual environment is activated:

```bash
cd languages/FSML/Python/LSP
. .venv/bin/activate
code vscode
```

Alternatively, edit `vscode/src/extension.ts` and replace `command: 'fsml-lsp'` with the absolute path to `.venv/bin/fsml-lsp`.

## Demonstration script

Use `examples/good.fsml`:

```fsml
initial state locked {
  ticket / collect -> unlocked;
  pass / alarm -> exception;
}

state unlocked {
  ticket / eject;
  pass -> locked;
}

state exception {
  ticket / eject;
  pass;
  mute;
  release -> locked;
}
```

Suggested sequence:

1. Delete a semicolon and show a syntax diagnostic.
2. Rename `unlocked` to `unloked` in a transition and show an unresolved-target diagnostic.
3. Invoke completion after `->` and show declared state names.
4. Use go-to-definition from `-> unlocked` to `state unlocked`.
5. Hover over `locked` and show state summary.
6. Add a state that is never targeted and show the unreachable-state warning.
7. Run document formatting.

## Relation to the existing FSML implementation

The existing Python FSML implementation defines the language in `Fsml.g4` and checks constraints such as distinct state IDs, single initial state, determinism, resolvable target states, and reachability. This LSP demo implements the same core checks in a Python 3 module designed for interactive editor feedback.

For a closer integration with the historical implementation, keep `server.py` and replace only the internals of `analyze(text)` with:

1. ANTLR `InputStream(text)`
2. `FsmlLexer`
3. `CommonTokenStream`
4. `FsmlParser`
5. conversion from the parser model to `AnalysisResult`

That keeps the LSP layer stable while allowing the grammar source of truth to be the existing ANTLR grammar.
