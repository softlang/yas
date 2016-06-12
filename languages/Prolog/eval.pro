eval(X, X) :- number(X).
eval(add(E1, E2), X0) :- eval(E1, X1), eval(E2, X2), is(X0, X1+X2).
eval(mul(E1, E2), X0) :- eval(E1, X1), eval(E2, X2), is(X0, X1*X2).
