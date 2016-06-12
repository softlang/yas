:- module(lalEq, []).

eq(Lal1, Lal2) :-
    apply(lalNorm:(=>), [Lal1, Lal]),
    apply(lalNorm:(=>), [Lal2, Lal]).
