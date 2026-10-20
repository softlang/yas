# BIPL LSP Demo

This directory contains a Language Server Protocol (LSP) implementation
for BIPL, the Basic Imperative Programming Language case study in
`languages/BIPL`.

It follows the same shape as the FSML LSP demo in
`languages/FSML/Python/LSP`, but the analysis is richer: BIPL has no
declarations and no Boolean literals, so variable types must be
inferred, and BIPL programs read their inputs from the initial store,
so an unassigned read is not automatically an error. The parser and
the checks are behind `bipl_lsp.analysis.analyze(text)`.

## Features

Implemented LSP features:

- syntax diagnostics, with recovery at statement boundaries
- semantic diagnostics
  - type errors (arithmetic on Booleans, non-Boolean `if`/`while`
    conditions, a variable assigned a value of a different type)
  - `maybe-uninitialized` warnings from a definite-assignment analysis
  - `input-variable` hints for variables that are never assigned
- hover with a variable's inferred type and whether it is an input
- go to definition for variables (first assignment)
- find references over all occurrences of a variable
- rename, rejecting names that are not valid BIPL identifiers
- completion for keywords and in-scope variables, labelled with types
- document symbols for the program's variables
- quick fix for `maybe-uninitialized`: initialise the variable

## Static semantics

Two analyses run in a single walk of the syntax tree.

**Type checking** follows `Language.BIPL.TypeChecker` in
`languages/BIPL/Haskell`: `typeOfExpr` and `okStmt` become
`analysis.type_of` and `analysis.check_stmt` over a context of
variable-type pairs. The Haskell version leaves its binary-operator
case as `-- TODO: Cases missing` and covers `Or, Add, Sub, Mul, Geq`;
this implementation covers the full operator set. Because BIPL has no
declarations, a variable's type comes from its first assignment, or is
inferred from a constrained use such as `i <= x`.

**Definite assignment** is a small data-flow pass, not part of the
typing discipline: a read is only safe if the variable is assigned on
every path reaching it, so an `if` contributes only what *both*
branches assign, and a `while` body contributes nothing because it may
run zero times.

The two are separated on purpose. A naive "read before write is an
error" rule would reject BIPL's own samples, which read program inputs
that are never assigned — `samples/factorialV1.bipl` reads `x` under
the comment "Assume x to be positive". Hence three severities: errors
for type mismatches, warnings for variables assigned somewhere but not
on this path, and information for variables never assigned anywhere,
which are program inputs. All samples in `languages/BIPL/samples`
analyse without errors, and a test keeps it that way.

## Layout

```text
languages/BIPL/Python/LSP/
  bipl_lsp/
    analysis.py       # lexer, parser, type checker, definite assignment
    server.py         # pygls-based language server
  examples/
    good.bipl
    bad.bipl
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
cd languages/BIPL/Python/LSP
python3 -m venv .venv
. .venv/bin/activate
python -m pip install --upgrade pip
python -m pip install -e '.[test]'
pytest
```

Run the language server on stdio:

```bash
bipl-lsp
```

or:

```bash
python -m bipl_lsp.server
```

Normally, users do not start the server manually. An editor client starts it and talks LSP over stdin/stdout.

## Try the analyzer without an editor

```bash
python - <<'PY'
from pathlib import Path
from bipl_lsp.analysis import analyze

text = Path('examples/bad.bipl').read_text()
result = analyze(text)
for diagnostic in result.diagnostics:
    print(f'{diagnostic.severity}: {diagnostic.message} at {diagnostic.range.start.line + 1}:{diagnostic.range.start.character + 1}')
PY
```

Expected output is three type errors (a non-Boolean `if` condition, a
variable that changes type, and `+` applied to a Boolean) and two
`maybe-uninitialized` warnings.

## VS Code demo client

The `vscode` folder contains a minimal VS Code extension that starts the Python language server for files ending in `.bipl`.

Install client dependencies:

```bash
cd languages/BIPL/Python/LSP/vscode
npm install
npm run compile
```

Open the `vscode` folder in VS Code and press `F5` to launch an Extension Development Host.

In the Extension Development Host:

1. Open `languages/BIPL/Python/LSP/examples/good.bipl` and hover over
   `x` to see the inferred type and the program-input hint.
2. Open `examples/bad.bipl` and inspect the diagnostics.
3. Ctrl-click a variable to jump to its first assignment.
4. Rename a variable with F2.
5. Use the quick fix on a `maybe-uninitialized` warning.
6. Open a sample from `languages/BIPL/samples`, such as
   `factorialV1.bipl`, and confirm it reports no errors.

The extension assumes the server command `bipl-lsp` is available on
`PATH`. The easiest way is to start VS Code from a shell where the
virtual environment is activated:

```bash
cd languages/BIPL/Python/LSP
. .venv/bin/activate
code vscode
```

Alternatively, set `bipl.serverCommand` in the VS Code settings to the
absolute path of `.venv/bin/bipl-lsp`.

## Relation to the existing BIPL implementation

`languages/BIPL/Haskell` defines the syntax in `Language.BIPL.Syntax`
and the typing discipline in `Language.BIPL.TypeChecker`; the concrete
syntax is given by `cs.egl` and the lexical syntax by `ls.term`. This
demo reimplements the parser directly in Python so that every token
and tree node carries a source range, which the LSP features need, and
it keeps the grammar's right-recursive associativity. It deviates from
the Haskell checker in one place: `okStmt` requires both branches of an
`if` to produce the same variable-type context, which would reject
programs where one branch introduces a helper variable, so the two
branches are checked independently here and branch agreement is used
only for definite assignment. Identifiers accept the conventional
letter-then-alphanumeric shape, a superset of the alpha-only names in
`ls.term`. Refactoring for better reuse between the Haskell and Python
implementations is conceivable.
