meaningOp(add, F1, F2, X, intval(I0)) :-
  passTo(F1, [X, I1]),
  apply(F2, [X, I2]),
  I0 is I1 + I2.

meaningOp(sub, F1, F2, X, intval(I0)) :-
  apply(F1, [X, I1]),
  apply(F2, [X, I2]),
  I0 is I1 - I2.

meaningOp(mult, F1, F2, X, intval(I0)) :-
  apply(F1, [X, I1]),
  apply(F2, [X, I2]),
  I0 is I1 * I2.

meaningOp(eq, F1, F2, boolval(B0)) :-
  apply(F1, [X, I1]),
  apply(F2, [X, I2]),
  toBoolean((I1==I2), B0).
