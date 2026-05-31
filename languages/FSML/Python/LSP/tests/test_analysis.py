from fsml_lsp.analysis import Position, Severity, analyze, completion_context, format_fsml, state_definition_at

GOOD = """initial state locked {
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
"""


def messages(result):
    return [diagnostic.message for diagnostic in result.diagnostics]


def test_good_model_has_no_diagnostics():
    result = analyze(GOOD)
    assert [state.name for state in result.states] == ["locked", "unlocked", "exception"]
    assert messages(result) == []


def test_unresolved_target_is_reported():
    result = analyze("initial state locked { pass -> unloked; }")
    assert "Unresolved target state 'unloked'." in messages(result)


def test_duplicate_event_in_state_is_reported():
    result = analyze("initial state locked { pass; pass -> locked; }")
    assert "Duplicate event 'pass' in state 'locked'." in messages(result)


def test_missing_initial_is_reported():
    result = analyze("state locked { pass; }")
    assert "No initial state declared." in messages(result)


def test_completion_context_after_arrow():
    text = "initial state locked { pass -> unl }"
    assert completion_context(text, Position(0, text.index("unl") + 3)) == "target"


def test_definition_lookup_for_state_reference():
    result = analyze(GOOD)
    # Position inside the target name 'unlocked' on line 1.
    state = state_definition_at(result, Position(1, 23))
    assert state is not None
    assert state.name == "unlocked"


def test_formatter_normalizes_spacing():
    result = analyze("initial state locked { ticket/collect -> unlocked; } state unlocked { pass->locked; }")
    assert format_fsml(result) == """initial state locked {
  ticket / collect -> unlocked;
}

state unlocked {
  pass -> locked;
}
"""
