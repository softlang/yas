# BNL Language Server

A Language Server Protocol implementation for **BNL**, the Binary Number
Language from [softlang/yas](https://github.com/softlang/yas/tree/master/languages/BNL),
with a VS Code client. The server is written in Python with
[pygls](https://github.com/openlawlibrary/pygls).

## The language

A BNL file contains a single binary number, optionally with a fractional
part, e.g. `101`, `10.01` or `110.0110`.

## LSP features

- **Diagnostics**: unexpected characters, spaces inside the number, a missing
  integer or fractional part, and more than one number per file
- **Hover**: the decimal value of a valid binary number
- **Completion**: `0`, `1` and `.` where they are valid
- **Quick fixes**: insert a missing `0` for empty files or remove invalid input
- **Formatting**: Removes leading and trailing spaces aswell as linebreaks

## Build and test the server

```bash
python3 -m venv .venv
. .venv/bin/activate
pip install -e '.[test]'
pytest
```

## VS Code client

```bash
cd vscode
npm install
npm run compile
```

The extension starts `bnl-lsp` (configurable via the `bnl.serverCommand`
setting), so launch VS Code from a shell with the virtual environment
activated:

```bash
. .venv/bin/activate
code vscode
```

Press `F5` to open an Extension Development Host, then open
`examples/good.bnl` or `examples/bad.bnl`.
