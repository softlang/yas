from pathlib import Path

from bipl_lsp.analysis import Position, Severity, analyze, occurrence_at

SAMPLES = Path(__file__).parent.parent / "examples"

# The canonical BIPL samples that ship with the language in languages/BIPL/samples.
YAS_SAMPLES = Path(__file__).resolve().parents[3] / "samples"


def codes(result, severity=None):
    return [d.code for d in result.diagnostics
            if severity is None or d.severity == severity]


def test_well_typed_program_has_no_errors():
    result = analyze("""
    {
      x = 14;
      y = 4;
      q = 0;
      r = x;
      while (r >= y) {
        r = r - y;
        q = q + 1;
      }
    }
    """)
    assert codes(result, Severity.ERROR) == []


def test_input_variable_is_informational_not_error():
    # factorial reads x without assigning it -- x is a program input
    result = analyze("""
    {
      y = 1;
      i = 1;
      while (i <= x) {
        y = y * i;
        i = i + 1;
      }
    }
    """)
    assert codes(result, Severity.ERROR) == []
    assert "input-variable" in codes(result)
    assert result.variables["x"].is_input
    assert result.variables["x"].type == "int"   # inferred from `i <= x`


def test_condition_must_be_boolean():
    result = analyze("{ x = 1; if (x) x = 2; }")
    assert "type-error" in codes(result, Severity.ERROR)


def test_reassignment_with_other_type_is_an_error():
    result = analyze("{ x = 1; x = 2 < 3; }")
    assert "type-error" in codes(result, Severity.ERROR)


def test_arithmetic_on_booleans_is_an_error():
    result = analyze("{ x = (1 < 2) + 3; }")
    assert "type-error" in codes(result, Severity.ERROR)


def test_maybe_uninitialized_after_partial_assignment():
    # y is only assigned in the then-branch, then read afterwards
    result = analyze("{ if (1 < 2) y = 1; z = y; }")
    assert "maybe-uninitialized" in codes(result, Severity.WARNING)


def test_assignment_on_both_branches_is_definite():
    result = analyze("{ if (1 < 2) y = 1; else y = 2; z = y; }")
    assert "maybe-uninitialized" not in codes(result)


def test_loop_body_assignment_is_not_definite():
    result = analyze("{ while (1 < 2) y = 1; z = y; }")
    assert "maybe-uninitialized" in codes(result, Severity.WARNING)


def test_parse_error_is_reported_and_recovered():
    result = analyze("{ x = ; y = 1; }")
    assert "parse-error" in codes(result, Severity.ERROR)
    assert "y" in result.variables    # recovery kept analyzing


def test_condition_infers_bool_for_input_variable():
    result = analyze("{ if (b) x = 1; }")
    assert result.variables["b"].type == "bool"
    assert codes(result, Severity.ERROR) == []


def test_occurrence_and_symbol_table():
    result = analyze("{ x = 1;\n  y = x + 2;\n}")
    occ = occurrence_at(result, Position(1, 6))   # the read of x
    assert occ and occ.name == "x" and occ.kind == "read"
    info = result.variables["x"]
    assert info.assignments == 1 and info.reads == 1
    assert info.definition.start.line == 0


def test_official_yas_samples_are_error_free():
    samples = sorted(YAS_SAMPLES.glob("*.bipl"))
    assert samples, f"no BIPL samples found under {YAS_SAMPLES}"
    for sample in samples:
        result = analyze(sample.read_text())
        errors = [d for d in result.diagnostics if d.severity == Severity.ERROR]
        assert errors == [], f"{sample.name}: {[d.message for d in errors]}"
