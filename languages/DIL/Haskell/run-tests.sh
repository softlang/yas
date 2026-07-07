#!/usr/bin/env sh
set -eu

OUT="${TMPDIR:-/tmp}/dil-wellformedness-test.out"
ERR="${TMPDIR:-/tmp}/dil-wellformedness-test.err"

GHC_FLAGS="
  -i.
  -i../../../lib/Haskell
  -XDataKinds
  -XTypeApplications
  -XTypeOperators
  -fforce-recomp
  -fno-code
"

echo "Positive tests: must compile"
for f in Language/DIL/Test/Positive/*.hs
do
  printf '  %s\n' "$(basename "$f")"
  if ! ghc $GHC_FLAGS "$f" >"$OUT" 2>"$ERR"
  then
    echo "ERROR: expected positive test to compile: $f"
    echo
    cat "$ERR"
    exit 1
  fi
done

echo "Negative tests: must fail"
for f in Language/DIL/Test/Negative/*.hs
do
  printf '  %s\n' "$(basename "$f")"
  expected="$(sed -n 's/^-- EXPECT_ERROR: //p' "$f" | head -n 1 || true)"

  if ghc $GHC_FLAGS "$f" >"$OUT" 2>"$ERR"
  then
    echo "ERROR: expected negative test to fail, but it compiled: $f"
    exit 1
  fi

  if [ -n "$expected" ] && ! grep -F "$expected" "$ERR" >/dev/null
  then
    echo "ERROR: negative test failed for the wrong reason: $f"
    echo "Expected stderr to contain:"
    echo "  $expected"
    echo
    echo "Actual stderr:"
    cat "$ERR"
    exit 1
  fi
done

echo "All DIL well-formedness tests behaved as expected."
