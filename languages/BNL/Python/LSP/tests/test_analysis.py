from pathlib import Path

from bnl_lsp.analysis import Position, Severity, analyze

SAMPLES = Path(__file__).parent.parent / "examples"


def codes(result, severity=None):
    return [d.code for d in result.diagnostics
            if severity is None or d.severity == severity]


def test_well_typed_rational_number_has_no_errors():
    result = analyze("""101.01""")
    assert codes(result, Severity.ERROR) == []


def test_well_typed_integer_has_no_errors():
    result = analyze("""101""")
    assert codes(result, Severity.ERROR) == []


def test_new_line_has_no_errors():
    result = analyze("""101 \n""")
    assert codes(result, Severity.ERROR) == []


def test_rest_too_early():
    result = analyze(""".01""")
    assert "syntax-error" in codes(result, Severity.ERROR)


def test_unknown_symbol():
    result = analyze("121.01")
    assert codes(result, Severity.ERROR) == ["lex-error"]


def test_unfinished_rest():
    result = analyze("""10.""")
    assert "syntax-error" in codes(result, Severity.ERROR)


def test_spaces_error():
    result = analyze("""10 .""")
    assert "lex-error" in codes(result, Severity.ERROR)


def test_unknown_symbol_position_and_message():
    diag = analyze("121.01").diagnostics[0]
    assert diag.range.start == Position(0, 1)
    assert diag.range.end == Position(0, 2)
    assert "'2'" in diag.message


def test_multiple_unknown_symbols_still_parse():
    result = analyze("1a0b")
    assert codes(result, Severity.ERROR) == ["lex-error", "lex-error"]
    assert result.ast is not None


def test_only_unknown_symbol():
    result = analyze("f")
    assert codes(result, Severity.ERROR) == ["lex-error", "syntax-error"]


def test_only_comma():
    result = analyze(".")
    assert "syntax-error" in codes(result, Severity.ERROR)


def test_empty_file():
    result = analyze("")
    assert "syntax-error" in codes(result, Severity.ERROR)


def test_second_comma():
    result = analyze("101.01.1")
    assert "syntax-error" in codes(result, Severity.ERROR)


def test_space_inside_number():
    result = analyze("10 01")
    assert codes(result, Severity.ERROR) == ["lex-error"]


def test_leading_and_trailing_spaces_have_no_errors():
    assert codes(analyze("   101"), Severity.ERROR) == []
    assert codes(analyze("101   "), Severity.ERROR) == []


def test_second_number_on_new_line():
    result = analyze("10\n11")
    assert "lex-error" in codes(result, Severity.ERROR)
    assert any("only contain one binary number" in d.message
               for d in result.diagnostics)


def test_official_yas_samples_are_error_free():
    for sample in (SAMPLES / "yas-samples").glob("*.bnl"):
        result = analyze(sample.read_text())
        errors = [d for d in result.diagnostics if d.severity == Severity.ERROR]
        assert errors == [], f"{sample.name}: {[d.message for d in errors]}"
