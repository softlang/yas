"""Static analysis for BIPL, the Basic Imperative Programming Language.

The concrete syntax follows languages/BIPL/cs.egl, the lexical syntax
follows languages/BIPL/ls.term, and the typing discipline follows
languages/BIPL/Haskell/Language/BIPL/TypeChecker.hs.  Everything the
language server needs -- parse tree, diagnostics, and a symbol table of
variable occurrences -- is computed by `analyze(text)`.

BIPL has no declarations and no Boolean literals: a variable's type is
inferred from its first assignment, or from a constrained use of an
unassigned "input" variable, and Boolean values arise only from
comparisons and logical operators.  Reading a variable that is never
assigned anywhere is reported as a program input rather than an error;
see the README for the resulting three levels of diagnostic severity.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum
from typing import Optional


# ---------------------------------------------------------------------------
# Positions and ranges (0-based, like LSP)
# ---------------------------------------------------------------------------

@dataclass(frozen=True)
class Position:
    line: int
    character: int

    def __le__(self, other: "Position") -> bool:
        return (self.line, self.character) <= (other.line, other.character)


@dataclass(frozen=True)
class Range:
    start: Position
    end: Position

    def contains(self, pos: Position) -> bool:
        return self.start <= pos <= self.end


class Severity(Enum):
    ERROR = 1
    WARNING = 2
    INFO = 3


@dataclass
class Diagnostic:
    range: Range
    message: str
    severity: Severity
    code: str


# ---------------------------------------------------------------------------
# Lexer
# ---------------------------------------------------------------------------

KEYWORDS = {"if", "else", "while"}

# Multi-character symbols must be tried before their prefixes.
SYMBOLS = ["||", "&&", "<=", "==", ">=", "<", ">", "=", "+", "-", "*",
           "!", ";", "{", "}", "(", ")"]


@dataclass
class Token:
    kind: str        # 'int' | 'ident' | keyword | symbol | 'eof'
    value: str
    range: Range


def tokenize(text: str) -> tuple[list[Token], list[Diagnostic]]:
    tokens: list[Token] = []
    diagnostics: list[Diagnostic] = []
    line, col, i = 0, 0, 0
    n = len(text)

    def pos() -> Position:
        return Position(line, col)

    while i < n:
        ch = text[i]
        if ch == "\n":
            line += 1
            col = 0
            i += 1
            continue
        if ch in " \t\r":
            i += 1
            col += 1
            continue
        if text.startswith("//", i):
            while i < n and text[i] != "\n":
                i += 1
                col += 1
            continue
        start = pos()
        if ch.isdigit():
            j = i
            while j < n and text[j].isdigit():
                j += 1
            value = text[i:j]
            col += j - i
            i = j
            tokens.append(Token("int", value, Range(start, pos())))
            continue
        if ch.isalpha() or ch == "_":
            j = i
            while j < n and (text[j].isalnum() or text[j] == "_"):
                j += 1
            value = text[i:j]
            col += j - i
            i = j
            kind = value if value in KEYWORDS else "ident"
            tokens.append(Token(kind, value, Range(start, pos())))
            continue
        for sym in SYMBOLS:
            if text.startswith(sym, i):
                col += len(sym)
                i += len(sym)
                tokens.append(Token(sym, sym, Range(start, pos())))
                break
        else:
            col += 1
            i += 1
            diagnostics.append(Diagnostic(
                Range(start, pos()),
                f"Unexpected character {ch!r}",
                Severity.ERROR,
                "lex-error",
            ))
    tokens.append(Token("eof", "", Range(pos(), pos())))
    return tokens, diagnostics


# ---------------------------------------------------------------------------
# Abstract syntax (with source ranges)
# ---------------------------------------------------------------------------

@dataclass
class Expr:
    range: Range


@dataclass
class IntConst(Expr):
    value: int


@dataclass
class Var(Expr):
    name: str


@dataclass
class Unary(Expr):
    op: str          # 'negate' | 'not'
    operand: Expr


@dataclass
class Binary(Expr):
    op: str          # 'or' 'and' 'lt' 'leq' 'eq' 'geq' 'gt' 'add' 'sub' 'mul'
    left: Expr
    right: Expr


@dataclass
class Stmt:
    range: Range


@dataclass
class Skip(Stmt):
    pass


@dataclass
class Assign(Stmt):
    name: str
    name_range: Range
    expr: Expr


@dataclass
class Block(Stmt):
    stmts: list[Stmt]


@dataclass
class If(Stmt):
    cond: Expr
    then: Stmt
    els: Optional[Stmt]


@dataclass
class While(Stmt):
    cond: Expr
    body: Stmt


BINOPS = {"||": "or", "&&": "and", "<": "lt", "<=": "leq", "==": "eq",
          ">=": "geq", ">": "gt", "+": "add", "-": "sub", "*": "mul"}


class Parser:
    """Recursive-descent parser following cs.egl (note: the EGL grammar is
    right-recursive, e.g. `[add] aexpr : term { '+' aexpr }?`, and we keep
    that associativity faithfully)."""

    def __init__(self, tokens: list[Token]):
        self.tokens = tokens
        self.i = 0
        self.diagnostics: list[Diagnostic] = []

    def peek(self) -> Token:
        return self.tokens[self.i]

    def next(self) -> Token:
        tok = self.tokens[self.i]
        if tok.kind != "eof":
            self.i += 1
        return tok

    def error(self, message: str, rng: Optional[Range] = None) -> None:
        self.diagnostics.append(Diagnostic(
            rng or self.peek().range, message, Severity.ERROR, "parse-error"))

    def expect(self, kind: str) -> Token:
        tok = self.peek()
        if tok.kind == kind:
            return self.next()
        self.error(f"Expected {kind!r} but found "
                   f"{tok.value!r}" if tok.kind != "eof" else f"Expected {kind!r} but reached end of file")
        return tok

    def sync(self) -> None:
        """Skip to a likely statement boundary after a parse error."""
        while self.peek().kind not in (";", "}", "eof"):
            self.next()
        if self.peek().kind == ";":
            self.next()

    # -- statements --------------------------------------------------------

    def parse_program(self) -> Stmt:
        stmt = self.parse_stmt()
        if self.peek().kind != "eof":
            self.error("Expected end of file after the program's top-level statement")
        return stmt

    def parse_stmt(self) -> Stmt:
        tok = self.peek()
        if tok.kind == ";":
            self.next()
            return Skip(tok.range)
        if tok.kind == "{":
            self.next()
            stmts = []
            while self.peek().kind not in ("}", "eof"):
                before = self.i
                stmts.append(self.parse_stmt())
                if self.i == before:      # no progress: recover
                    self.error(f"Unexpected {self.peek().value!r}")
                    self.next()
            close = self.expect("}")
            return Block(Range(tok.range.start, close.range.end), stmts)
        if tok.kind == "if":
            self.next()
            self.expect("(")
            cond = self.parse_expr()
            self.expect(")")
            then = self.parse_stmt()
            els = None
            end = then.range.end
            if self.peek().kind == "else":
                self.next()
                els = self.parse_stmt()
                end = els.range.end
            return If(Range(tok.range.start, end), cond, then, els)
        if tok.kind == "while":
            self.next()
            self.expect("(")
            cond = self.parse_expr()
            self.expect(")")
            body = self.parse_stmt()
            return While(Range(tok.range.start, body.range.end), cond, body)
        if tok.kind == "ident":
            name = self.next()
            self.expect("=")
            expr = self.parse_expr()
            semi = self.expect(";")
            end = semi.range.end if semi.kind == ";" else expr.range.end
            return Assign(Range(name.range.start, end), name.value, name.range, expr)
        self.error(f"Expected a statement but found {tok.value or 'end of file'!r}")
        self.sync()
        return Skip(tok.range)

    # -- expressions (precedence per cs.egl) -------------------------------

    def binary(self, ops: tuple[str, ...], sub, right):
        left = sub()
        tok = self.peek()
        if tok.kind in ops:
            self.next()
            rhs = right()
            return Binary(Range(left.range.start, rhs.range.end),
                          BINOPS[tok.kind], left, rhs)
        return left

    def parse_expr(self) -> Expr:      # [or]
        return self.binary(("||",), self.parse_bexpr, self.parse_expr)

    def parse_bexpr(self) -> Expr:     # [and]
        return self.binary(("&&",), self.parse_cexpr, self.parse_bexpr)

    def parse_cexpr(self) -> Expr:     # comparisons (non-chaining)
        return self.binary(("<", "<=", "==", ">=", ">"),
                           self.parse_aexpr, self.parse_aexpr)

    def parse_aexpr(self) -> Expr:     # [add]/[sub]
        return self.binary(("+", "-"), self.parse_term, self.parse_aexpr)

    def parse_term(self) -> Expr:      # [mul]
        return self.binary(("*",), self.parse_factor, self.parse_term)

    def parse_factor(self) -> Expr:
        tok = self.peek()
        if tok.kind == "-":
            self.next()
            operand = self.parse_factor()
            return Unary(Range(tok.range.start, operand.range.end), "negate", operand)
        if tok.kind == "!":
            self.next()
            operand = self.parse_factor()
            return Unary(Range(tok.range.start, operand.range.end), "not", operand)
        if tok.kind == "int":
            self.next()
            return IntConst(tok.range, int(tok.value))
        if tok.kind == "ident":
            self.next()
            return Var(tok.range, tok.value)
        if tok.kind == "(":
            self.next()
            expr = self.parse_expr()
            self.expect(")")
            return expr
        self.error(f"Expected an expression but found {tok.value or 'end of file'!r}")
        if tok.kind not in (";", ")", "}", "eof"):
            self.next()
        return IntConst(tok.range, 0)


# ---------------------------------------------------------------------------
# Static semantics: type checking and definite assignment
# ---------------------------------------------------------------------------

@dataclass
class Occurrence:
    name: str
    range: Range
    kind: str                      # 'assign' | 'read'


@dataclass
class VarInfo:
    name: str
    type: Optional[str] = None     # 'int' | 'bool' | None (unknown)
    is_input: bool = False         # read before any assignment exists
    occurrences: list[Occurrence] = field(default_factory=list)

    @property
    def definition(self) -> Optional[Range]:
        for occ in self.occurrences:
            if occ.kind == "assign":
                return occ.range
        return self.occurrences[0].range if self.occurrences else None

    @property
    def assignments(self) -> int:
        return sum(1 for o in self.occurrences if o.kind == "assign")

    @property
    def reads(self) -> int:
        return sum(1 for o in self.occurrences if o.kind == "read")


INT_OPS = {"add", "sub", "mul"}
CMP_OPS = {"lt", "leq", "eq", "geq", "gt"}
BOOL_OPS = {"or", "and"}

OP_SYMBOL = {v: k for k, v in BINOPS.items()}


class Checker:
    def __init__(self) -> None:
        self.vars: dict[str, VarInfo] = {}
        self.diagnostics: list[Diagnostic] = []
        self.assigned_anywhere: set[str] = set()

    def var(self, name: str) -> VarInfo:
        if name not in self.vars:
            self.vars[name] = VarInfo(name)
        return self.vars[name]

    def error(self, rng: Range, message: str, code: str,
              severity: Severity = Severity.ERROR) -> None:
        self.diagnostics.append(Diagnostic(rng, message, severity, code))

    # -- expressions -------------------------------------------------------

    def demand(self, expr: Expr, expected: str, assigned: set[str],
               context: str) -> None:
        """Type-check `expr` and require type `expected`; unknown input
        variables are inferred to have the expected type (inference from
        use, since BIPL has no declarations)."""
        if isinstance(expr, Var):
            info = self.read_var(expr, assigned)
            if info.type is None:
                info.type = expected            # inference from use
                return
            if info.type != expected:
                self.error(expr.range,
                           f"{context}, but '{expr.name}' has type {info.type}",
                           "type-error")
            return
        actual = self.type_of(expr, assigned)
        if actual is not None and actual != expected:
            self.error(expr.range, f"{context}, but this expression has type {actual}",
                       "type-error")

    def read_var(self, expr: Var, assigned: set[str]) -> VarInfo:
        info = self.var(expr.name)
        info.occurrences.append(Occurrence(expr.name, expr.range, "read"))
        if expr.name not in assigned:
            if expr.name in self.assigned_anywhere:
                self.error(expr.range,
                           f"Variable '{expr.name}' may be read before it is assigned",
                           "maybe-uninitialized", Severity.WARNING)
            elif not info.is_input:
                info.is_input = True
                self.error(expr.range,
                           f"Variable '{expr.name}' is never assigned; "
                           f"treated as a program input",
                           "input-variable", Severity.INFO)
        return info

    def type_of(self, expr: Expr, assigned: set[str]) -> Optional[str]:
        if isinstance(expr, IntConst):
            return "int"
        if isinstance(expr, Var):
            return self.read_var(expr, assigned).type
        if isinstance(expr, Unary):
            if expr.op == "negate":
                self.demand(expr.operand, "int", assigned,
                            "Operator '-' expects an integer operand")
                return "int"
            self.demand(expr.operand, "bool", assigned,
                        "Operator '!' expects a boolean operand")
            return "bool"
        if isinstance(expr, Binary):
            sym = OP_SYMBOL[expr.op]
            if expr.op in INT_OPS or expr.op in CMP_OPS:
                operand_type, result = "int", ("int" if expr.op in INT_OPS else "bool")
            else:
                operand_type, result = "bool", "bool"
            self.demand(expr.left, operand_type, assigned,
                        f"Operator '{sym}' expects {operand_type}eger operands"
                        if operand_type == "int"
                        else f"Operator '{sym}' expects boolean operands")
            self.demand(expr.right, operand_type, assigned,
                        f"Operator '{sym}' expects {operand_type}eger operands"
                        if operand_type == "int"
                        else f"Operator '{sym}' expects boolean operands")
            return result
        return None

    # -- statements --------------------------------------------------------

    def collect_assigned(self, stmt: Stmt) -> None:
        if isinstance(stmt, Assign):
            self.assigned_anywhere.add(stmt.name)
        elif isinstance(stmt, Block):
            for s in stmt.stmts:
                self.collect_assigned(s)
        elif isinstance(stmt, If):
            self.collect_assigned(stmt.then)
            if stmt.els:
                self.collect_assigned(stmt.els)
        elif isinstance(stmt, While):
            self.collect_assigned(stmt.body)

    def check_stmt(self, stmt: Stmt, assigned: set[str]) -> set[str]:
        if isinstance(stmt, Skip):
            return assigned
        if isinstance(stmt, Assign):
            t = self.type_of(stmt.expr, assigned)
            info = self.var(stmt.name)
            info.occurrences.append(Occurrence(stmt.name, stmt.name_range, "assign"))
            if t is not None:
                if info.type is None:
                    info.type = t
                elif info.type != t:
                    self.error(stmt.name_range,
                               f"Variable '{stmt.name}' has type {info.type} "
                               f"but is assigned a value of type {t}",
                               "type-error")
            return assigned | {stmt.name}
        if isinstance(stmt, Block):
            for s in stmt.stmts:
                assigned = self.check_stmt(s, assigned)
            return assigned
        if isinstance(stmt, If):
            self.demand(stmt.cond, "bool", assigned,
                        "The condition of 'if' must be boolean")
            a_then = self.check_stmt(stmt.then, set(assigned))
            a_else = self.check_stmt(stmt.els, set(assigned)) if stmt.els else set(assigned)
            # only variables assigned on *both* branches are definitely assigned
            return assigned | (a_then & a_else)
        if isinstance(stmt, While):
            self.demand(stmt.cond, "bool", assigned,
                        "The condition of 'while' must be boolean")
            self.check_stmt(stmt.body, set(assigned))
            # the body may run zero times
            return assigned
        return assigned


# ---------------------------------------------------------------------------
# Entry point and LSP query helpers
# ---------------------------------------------------------------------------

@dataclass
class AnalysisResult:
    text: str
    ast: Stmt
    diagnostics: list[Diagnostic]
    variables: dict[str, VarInfo]


def analyze(text: str) -> AnalysisResult:
    tokens, diagnostics = tokenize(text)
    parser = Parser(tokens)
    ast = parser.parse_program()
    diagnostics += parser.diagnostics
    checker = Checker()
    checker.collect_assigned(ast)
    checker.check_stmt(ast, set())
    diagnostics += checker.diagnostics
    diagnostics.sort(key=lambda d: (d.range.start.line, d.range.start.character))
    return AnalysisResult(text, ast, diagnostics, checker.vars)


def occurrence_at(result: AnalysisResult, pos: Position) -> Optional[Occurrence]:
    for info in result.variables.values():
        for occ in info.occurrences:
            if occ.range.contains(pos):
                return occ
    return None


def word_at(text: str, pos: Position) -> Optional[str]:
    lines = text.split("\n")
    if pos.line >= len(lines):
        return None
    line = lines[pos.line]
    start = end = pos.character
    while start > 0 and (line[start - 1].isalnum() or line[start - 1] == "_"):
        start -= 1
    while end < len(line) and (line[end].isalnum() or line[end] == "_"):
        end += 1
    return line[start:end] or None
