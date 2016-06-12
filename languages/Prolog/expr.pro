expr(X) :- number(X).
expr(add(E1, E2)) :- expr(E1), expr(E2).
expr(mul(E1, E2)) :- expr(E1), expr(E2).
