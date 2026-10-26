from dataclasses import dataclass
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


@dataclass
class Token:
    kind: str
    text: str
    range: Range


def tokenize(text: str) -> tuple[list[Token], list[Diagnostic]]:
    tokens: list[Token] = []
    diagnostics: list[Diagnostic] = []
    i: int = 0
    line: int = 0
    line_start: int = 0
    started_binary: bool = False
    added_linebreak: bool = False
    extra_number: Optional[Diagnostic] = None

    while i < len(text):
        ch: str = text[i]
        start: int = i
        kind: str = ""

        if ch == "\n":
            i += 1
            line += 1
            line_start = i
            if started_binary:
                added_linebreak = True
            continue

        if ch.isspace():
            j = i
            while j < len(text) and text[j].isspace() and text[j] != "\n":
                j += 1
            trailing = j >= len(text) or text[j] == "\n"
            if started_binary and not trailing:
                diagnostics.append(Diagnostic(
                    Range(
                        Position(line, i - line_start),
                        Position(line, j - line_start),
                    ),
                    "Spaces are not allowed inside a binary number",
                    Severity.ERROR,
                    "lex-error",
                ))
            i = j
            continue

        if ch == "1":
            kind = "ONE"
        elif ch == "0":
            kind = "ZERO"
        elif ch == ".":
            kind = "COMMA"
        i += 1

        rng = Range(
            Position(line, start - line_start),
            Position(line, i - line_start),
        )

        if kind == "":
            diagnostics.append(Diagnostic(
                rng,
                f"Unexpected character {ch!r}",
                Severity.ERROR,
                "lex-error",
            ))
            continue
        else:
            if added_linebreak:
                # one diagnostic spanning everything after the first number
                if extra_number is None:
                    extra_number = Diagnostic(
                        rng,
                        "A .bnl file can only contain one binary number",
                        Severity.ERROR,
                        "lex-error",
                    )
                    diagnostics.append(extra_number)
                else:
                    extra_number.range = Range(extra_number.range.start, rng.end)
            started_binary = True

        tokens.append(Token(kind=kind, text=ch, range=rng))

    return tokens, diagnostics


# ---------------------------------------------------------------------------
# Parser
# ---------------------------------------------------------------------------


@dataclass
class Zero:
    pass


@dataclass
class One:
    pass


@dataclass
class Single:
    bit: object


@dataclass
class Many:
    bit: object
    bits: object


@dataclass
class Integer:
    pass


@dataclass
class Rational:
    bits: object


@dataclass
class Number:
    bits: object
    rest: object


# --- Parser ---
class Parser:
    def __init__(self, tokens: list[Token]):
        self.tokens = tokens
        self.i = 0
        self.diagnostics: list[Diagnostic] = []

    def eof(self) -> bool:
        return self.i >= len(self.tokens)

    def peek(self, *kinds: str) -> Optional[Token]:
        if self.eof():
            return None
        token = self.tokens[self.i]
        return token if not kinds or token.kind in kinds else None

    def advance(self) -> Optional[Token]:
        if self.eof():
            return None
        token = self.tokens[self.i]
        self.i += 1
        return token

    def expect(self, *kinds: str) -> Optional[Token]:
        token = self.peek(*kinds)
        if token:
            return self.advance()
        self.error_here("Expected a bit ('0' or '1').")
        return None

    def add_error(self, rng: Range, message: str) -> None:
        self.diagnostics.append(
            Diagnostic(rng, message, Severity.ERROR, "syntax-error")
        )

    def error_here(self, message: str) -> None:
        if not self.eof():
            rng = self.tokens[self.i].range
        else:
            pos = self.tokens[-1].range.end if self.tokens else Position(0, 0)
            rng = Range(pos, pos)
        self.add_error(rng, message)

    def recover_to(self, *kinds: str) -> None:
        while not self.eof() and self.tokens[self.i].kind not in kinds:
            self.i += 1

    def parse(self) -> Optional[Number]:
        number = self.parse_number()

        if not self.eof():
            first = self.tokens[self.i]
            leftover = self.tokens[self.i:]
            self.i = len(self.tokens)
            if not any(d.range.start == first.range.start for d in self.diagnostics):
                text = "".join(t.text for t in leftover)
                self.add_error(Range(first.range.start, leftover[-1].range.end),
                               f"Unexpected '{text}' after binary number.")

        return number

    def parse_number(self) -> Optional[Number]:
        bits = self.parse_bits()
        if bits is None:
            self.recover_to("COMMA")
        rest = self.parse_rest()
        if bits is None or rest is None:
            return None
        return Number(bits, rest)

    def parse_bits(self) -> Optional[Single | Many]:
        bits: list[Zero | One] = []
        while self.peek("ZERO", "ONE"):
            bit = self.parse_bit()
            if bit:
                bits.append(bit)

        if not bits:
            self.error_here("Expected at least one bit ('0' or '1').")
            return None

        result: Single | Many = Single(bits[-1])
        for bit in reversed(bits[:-1]):
            result = Many(bit, result)
        return result

    def parse_bit(self) -> Optional[Zero | One]:
        token = self.expect("ZERO", "ONE")
        if not token:
            return None
        return Zero() if token.kind == "ZERO" else One()

    def parse_rest(self) -> Optional[Integer | Rational]:
        if not self.peek("COMMA"):
            return Integer()

        self.advance()
        bits = self.parse_bits()
        if bits is None:
            return None
        return Rational(bits)


@dataclass
class AnalysisResult:
    text: str
    ast: Number | None
    diagnostics: list[Diagnostic]


def analyze(text: str) -> AnalysisResult:
    tokens, diagnostics = tokenize(text)
    parser = Parser(tokens)
    program = parser.parse()
    diagnostics += parser.diagnostics
    diagnostics.sort(key=lambda d: (d.range.start.line, d.range.start.character))
    return AnalysisResult(text, program, diagnostics)


def word_at(text: str, pos: Position) -> Optional[str]:
    lines = text.split("\n")
    if pos.line >= len(lines):
        return None
    line = lines[pos.line]
    start = end = min(pos.character, len(line))
    while start > 0 and not line[start - 1].isspace():
        start -= 1
    while end < len(line) and not line[end].isspace():
        end += 1
    return line[start:end] or None


def parse_binary(binary_str: str) -> int | float | None:
    if "." not in binary_str:
        return int(binary_str, 2)
    integer, rest = binary_str.split(".")
    if not integer or not rest:
        return None
    num: int = int(integer, 2)
    for i, digit in enumerate(rest, start=1):
        num += int(digit) * 2 ** -i
    return num
