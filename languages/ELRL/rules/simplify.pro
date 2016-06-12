simplify(binary(add, X, intconst(0)), X).
simplify(binary(mul, X, intconst(1)), X).
simplify(binary(mul, X, intconst(0)), intconst(0)).
simplify(
  binary(add, binary(mul, X, Y), binary(mul, X, Z)),
  binary(mul, X, binary(add, Y, Z))).
