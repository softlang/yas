% BEGIN ...
:- module(lalUeber, []).
% END ...
translate(Lals, C, Ues) :-
    map(lalUeber:entry(Lals, C), C, Uess),
    concat(Uess, Ues).

entry(_, _, language(_, _), []).
entry(_, _, function(_, _), []).
entry(_, _, relation(_, _), []).
entry(Lals, C, constant(N1, F), [elementOf(F, L)]) :-
    member(constant(N1, ref(N2)), Lals),
    member(language(N2, L), C).
entry(Lals, C, axiom(N, M), Ues) :-
    member(axiom([N], X), Lals),
    formula(C, M, X, Ues).

formula(C, M, X0, [elementOf(F, L)|Ues]) :-
    X0 =.. [Op, bindv(V), ref(N), X1],
    member(Op, [forall, exists, existsu]),
    member(language(N, L), C),
    member((V, F), M),
    formula(C, M, X1, Ues).

formula(I, M, X0, Ues3) :-
    X0 =.. [Op, X1, X2],
    member(Op, [and, ifthen, iff]),
    formula(I, M, X1, Ues1),
    formula(I, M, X2, Ues2),
    append(Ues1, Ues2, Ues3).

formula(I, M, relapp(N1, Ts1), [relatesTo(N2, Ts2)]) :-
    ( member(relation(N1, N2), I) -> true; N2 = N1 ),
    map(lalUeber:argument(I, M), Ts1, Ts2).

formula(I, M, T0, [mapsTo(N2, Ts2, [T2])]) :-
    ( T0 = eq(funapp(N1, Ts1), T1);
      T0 = eq(T1, funapp(N1, Ts1)) ),
    ( member(function(N1, N2), I) -> true; N2 = N1 ),
    map(lalUeber:argument(I, M), Ts1, Ts2),
    argument(I, M, T1, T2).

argument(I, _, var(V), F) :- member(constant(V, F), I).
argument(_, M, var(V), F) :- member((V, F), M).
