% BEGIN ...
:- module(bstlTerm, []).
% END ...
interpret(sequ(X1, X2), T1, T3) :-
    interpret(X1, T1, T2),
    interpret(X2, T2, T3).
interpret(renameSort(_, _), T, T).
interpret(renameSym(N1, N2), T1, T2) :-
    T1 =.. [N3|Ts1],
    ( N3 = N1 -> N4 = N2; N4 = N3 ),
    map(bstlTerm:interpret(renameSym(N1, N2)), Ts1, Ts2),
    T2 =.. [N4|Ts2].
