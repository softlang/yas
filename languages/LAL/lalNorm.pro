:- module(lalNorm, []).

Ds1 => Ds3 :-
    map(try(lalNorm:(=>)), Ds1, Ds2),
    list_to_set(Ds2, Ds3).

language(L, [L]) => language(L, []).
