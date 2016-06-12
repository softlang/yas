:- module(bnlFormula, []).

formula(-1).
formula(0).
formula(1).
formula(2).
formula(X+Y) :- formula(X), formula(Y).
formula(X-Y) :- formula(X), formula(Y).
formula(X^Y) :- formula(X), formula(Y).
