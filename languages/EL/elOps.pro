:- module(elOps, []).

uop(neg, intval(I1), intval(I0)) :- I0 is - I1.
uop(not, boolval(true), boolval(false)).
uop(not, boolval(false), boolval(true)).
bop(add, intval(I1), intval(I2), intval(I0)) :- I0 is I1 + I2.
bop(sub, intval(I1), intval(I2), intval(I0)) :- I0 is I1 - I2.
bop(mul, intval(I1), intval(I2), intval(I0)) :- I0 is I1 * I2.
bop(eq, intval(I1), intval(I2), boolval(true)) :- I1 == I2.
bop(eq, intval(I1), intval(I2), boolval(false)) :- I1 \= I2.
bop(geq, intval(I1), intval(I2), boolval(true)) :- I1 >= I2.
bop(geq, intval(I1), intval(I2), boolval(false)) :- I1 < I2.
bop(gt, intval(I1), intval(I2), boolval(true)) :- I1 > I2.
bop(gt, intval(I1), intval(I2), boolval(false)) :- I1 =< I2.
bop(and, boolval(true), boolval(true), boolval(true)).
bop(and, boolval(B1), boolval(B2), boolval(false)) :- \+ B1; \+ B2.
bop(or, boolval(false), boolval(false), boolval(false)).
bop(or, boolval(B1), boolval(B2), boolval(true)) :- B1; B2.
