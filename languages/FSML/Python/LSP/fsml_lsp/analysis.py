"""Analysis support for the FSML language server.

The analyzer deliberately mirrors the tiny FSML grammar used in the existing
Python/ANTLR implementation:

    fsm        : statedecl+ EOF ;
    statedecl  : 'initial'? 'state' stateid '{' transition* '}' ;
    transition : event ('/' action)? ('->' stateid)? ';' ;
    stateid    : NAME ;
    event      : NAME ;
    action     : NAME ;

It is self-contained so that the LSP demo can run with a modern Python 3 LSP
stack even when the surrounding historical Python implementation still uses
ANTLR/Python2 generated files.  Replacing `parse` by a call to the existing
ANTLR parser is straightforward; the rest of the LSP server uses only the
AnalysisResult data structure below.
"""
from __future__ import annotations

from dataclasses import dataclass, field
from enum import Enum
import re
from typing import Iterable, Optional


@dataclass(frozen=True, order=True)
class Position:
    line: int
    character: int


@dataclass(frozen=True)
class Range:
    start: Position
    end: Position

    def contains(self, position: Position) -> bool:
        if position.line < self.start.line or position.line > self.end.line:
            return False
        if position.line == self.start.line and position.character < self.start.character:
            return False
        if position.line == self.end.line and position.character > self.end.character:
            return False
        return True


class Severity(str, Enum):
    ERROR = "error"
    WARNING = "warning"
    INFO = "info"


@dataclass(frozen=True)
class Diagnostic:
    range: Range
    message: str
    severity: Severity = Severity.ERROR
    code: str = "fsml"


@dataclass(frozen=True)
class Token:
    kind: str
    text: str
    range: Range


@dataclass
class Transition:
    event: str
    event_range: Range
    action: Optional[str]
    action_range: Optional[Range]
    target: Optional[str]
    target_range: Optional[Range]
    range: Range


@dataclass
class State:
    name: str
    name_range: Range
    range: Range
    initial: bool = False
    transitions: list[Transition] = field(default_factory=list)


@dataclass
class AnalysisResult:
    text: str
    states: list[State]
    diagnostics: list[Diagnostic]
    tokens: list[Token]

    @property
    def state_declarations(self) -> dict[str, list[State]]:
        result: dict[str, list[State]] = {}
        for state in self.states:
            result.setdefault(state.name, []).append(state)
        return result

    @property
    def state_names(self) -> list[str]:
        return [state.name for state in self.states]


_KEYWORDS = {"initial", "state"}
_TOKEN_RE = re.compile(r"->|[A-Za-z]+|[{};/]|\S")


def _position_at(text: str, offset: int) -> Position:
    # LSP positions are zero-based. FSML is ASCII by grammar, so character
    # offsets are suitable for this demo.
    line = text.count("\n", 0, offset)
    last_newline = text.rfind("\n", 0, offset)
    character = offset if last_newline == -1 else offset - last_newline - 1
    return Position(line, character)


def _range_at(text: str, start: int, end: int) -> Range:
    return Range(_position_at(text, start), _position_at(text, end))


def _tokenize(text: str) -> list[Token]:
    tokens: list[Token] = []
    for match in _TOKEN_RE.finditer(text):
        raw = match.group(0)
        if raw == "->":
            kind = "ARROW"
        elif raw in "{};/":
            kind = raw
        elif re.fullmatch(r"[A-Za-z]+", raw):
            kind = raw.upper() if raw in _KEYWORDS else "NAME"
        else:
            kind = "UNKNOWN"
        tokens.append(Token(kind, raw, _range_at(text, match.start(), match.end())))
    return tokens


class Parser:
    def __init__(self, text: str):
        self.text = text
        self.tokens = _tokenize(text)
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

    def expect(self, kind: str, message: str) -> Optional[Token]:
        token = self.peek(kind)
        if token:
            return self.advance()
        self.error_here(message)
        return None

    def error_here(self, message: str) -> None:
        if not self.eof():
            rng = self.tokens[self.i].range
        else:
            pos = _position_at(self.text, len(self.text))
            rng = Range(pos, pos)
        self.diagnostics.append(Diagnostic(rng, message))

    def recover_to(self, *kinds: str) -> None:
        while not self.eof() and self.tokens[self.i].kind not in kinds:
            self.i += 1

    def parse(self) -> AnalysisResult:
        states: list[State] = []
        while not self.eof():
            if self.peek("INITIAL", "STATE"):
                state = self.parse_state()
                if state:
                    states.append(state)
            else:
                bad = self.advance()
                if bad:
                    self.diagnostics.append(
                        Diagnostic(bad.range, f"Expected 'state' or 'initial state', got '{bad.text}'.")
                    )
        result = AnalysisResult(self.text, states, self.diagnostics, self.tokens)
        result.diagnostics.extend(_semantic_diagnostics(result))
        return result

    def parse_state(self) -> Optional[State]:
        start = self.peek()
        initial = bool(self.peek("INITIAL"))
        if initial:
            self.advance()
        if not self.expect("STATE", "Expected 'state'."):
            self.recover_to("STATE", "}")
            return None
        name_token = self.expect("NAME", "Expected a state name.")
        if not name_token:
            self.recover_to("{", "}")
            return None
        self.expect("{", "Expected '{' after state name.")

        transitions: list[Transition] = []
        while not self.eof() and not self.peek("}"):
            if self.peek("NAME"):
                transition = self.parse_transition()
                if transition:
                    transitions.append(transition)
            else:
                bad = self.advance()
                if bad:
                    self.diagnostics.append(
                        Diagnostic(bad.range, f"Expected a transition event or '}}', got '{bad.text}'.")
                    )
                    self.recover_to(";", "}")
                    if self.peek(";"):
                        self.advance()
        end_token = self.expect("}", "Expected '}' to close state declaration.")
        end_range = end_token.range if end_token else name_token.range
        return State(name_token.text, name_token.range, Range(start.range.start, end_range.end), initial, transitions)

    def parse_transition(self) -> Optional[Transition]:
        event_token = self.expect("NAME", "Expected a transition event.")
        if not event_token:
            return None
        action_token = None
        target_token = None
        if self.peek("/"):
            self.advance()
            action_token = self.expect("NAME", "Expected an action name after '/'.")
        if self.peek("ARROW"):
            self.advance()
            target_token = self.expect("NAME", "Expected a target state name after '->'.")
        semi = self.expect(";", "Expected ';' after transition.")
        if semi is None:
            self.recover_to(";", "}")
            if self.peek(";"):
                semi = self.advance()
        end_range = semi.range if semi else (target_token or action_token or event_token).range
        return Transition(
            event_token.text,
            event_token.range,
            action_token.text if action_token else None,
            action_token.range if action_token else None,
            target_token.text if target_token else None,
            target_token.range if target_token else None,
            Range(event_token.range.start, end_range.end),
        )


def analyze(text: str) -> AnalysisResult:
    return Parser(text).parse()


def _semantic_diagnostics(result: AnalysisResult) -> list[Diagnostic]:
    diagnostics: list[Diagnostic] = []
    decls = result.state_declarations

    for name, states in decls.items():
        if len(states) > 1:
            for state in states:
                diagnostics.append(
                    Diagnostic(state.name_range, f"Duplicate state declaration '{name}'.", Severity.ERROR, "duplicate-state")
                )

    initials = [state for state in result.states if state.initial]
    if len(initials) == 0 and result.states:
        diagnostics.append(
            Diagnostic(result.states[0].name_range, "No initial state declared.", Severity.ERROR, "no-initial-state")
        )
    elif len(initials) > 1:
        for state in initials:
            diagnostics.append(
                Diagnostic(state.name_range, "Multiple initial states declared.", Severity.ERROR, "multiple-initial-states")
            )

    known = set(decls)
    for state in result.states:
        seen_events: dict[str, Range] = {}
        for transition in state.transitions:
            if transition.event in seen_events:
                diagnostics.append(
                    Diagnostic(
                        transition.event_range,
                        f"Duplicate event '{transition.event}' in state '{state.name}'.",
                        Severity.ERROR,
                        "duplicate-event",
                    )
                )
            else:
                seen_events[transition.event] = transition.event_range

            if transition.target is not None and transition.target not in known:
                diagnostics.append(
                    Diagnostic(
                        transition.target_range or transition.range,
                        f"Unresolved target state '{transition.target}'.",
                        Severity.ERROR,
                        "unresolved-target",
                    )
                )

    if len(initials) == 1:
        reachable = _reachable_states(initials[0].name, result.states)
        for state in result.states:
            if state.name not in reachable:
                diagnostics.append(
                    Diagnostic(state.name_range, f"State '{state.name}' is unreachable.", Severity.WARNING, "unreachable-state")
                )
    return diagnostics


def _reachable_states(initial: str, states: Iterable[State]) -> set[str]:
    by_name = {state.name: state for state in states}
    todo = [initial]
    seen: set[str] = set()
    while todo:
        name = todo.pop()
        if name in seen or name not in by_name:
            continue
        seen.add(name)
        for transition in by_name[name].transitions:
            target = transition.target or name
            if target not in seen:
                todo.append(target)
    return seen


def word_at(result: AnalysisResult, position: Position) -> Optional[Token]:
    for token in result.tokens:
        if token.kind == "NAME" and token.range.contains(position):
            return token
    return None


def state_definition_at(result: AnalysisResult, position: Position) -> Optional[State]:
    token = word_at(result, position)
    if not token:
        return None
    states = result.state_declarations.get(token.text, [])
    return states[0] if states else None


def state_at(result: AnalysisResult, position: Position) -> Optional[State]:
    for state in result.states:
        if state.range.contains(position):
            return state
    return None


def transition_at(result: AnalysisResult, position: Position) -> Optional[Transition]:
    state = state_at(result, position)
    if not state:
        return None
    for transition in state.transitions:
        if transition.range.contains(position):
            return transition
    return None


def completion_context(text: str, position: Position) -> str:
    """Return a coarse completion context: 'target' or 'top-level'."""
    lines = text.splitlines(keepends=True)
    offset = 0
    for line_no, line in enumerate(lines):
        if line_no == position.line:
            offset += min(position.character, len(line))
            break
        offset += len(line)
    prefix = text[max(0, offset - 80):offset]
    if re.search(r"->\s*[A-Za-z]*$", prefix):
        return "target"
    return "top-level"


def format_fsml(result: AnalysisResult) -> str:
    blocks: list[str] = []
    for state in result.states:
        header = f"{'initial ' if state.initial else ''}state {state.name} {{"
        lines = [header]
        for transition in state.transitions:
            line = f"  {transition.event}"
            if transition.action:
                line += f" / {transition.action}"
            if transition.target:
                line += f" -> {transition.target}"
            line += ";"
            lines.append(line)
        lines.append("}")
        blocks.append("\n".join(lines))
    return "\n\n".join(blocks) + ("\n" if blocks else "")
