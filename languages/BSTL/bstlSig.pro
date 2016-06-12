% BEGIN ...
:- module(bstlSig, []).
% END ...
interpret(sequ(X1, X2), T1, T3) :-
    interpret(X1, T1, T2),
    interpret(X2, T2, T3).
interpret(renameSort(N1, N2), T1, T2) :-
    map(bstlSig:renameSort1(N1, N2), T1, T2).
interpret(renameSym(N1, N2), T1, T2) :-
    map(bstlSig:renameSym(N1, N2), T1, T2).

renameSort1(N1, N2, (F, Ss1, S1), (F, Ss2, S2)) :-
    renameSort2(N1, N2, S1, S2),
    map(bstlSig:renameSort2(N1, N2), Ss1, Ss2).

renameSort2(N1, N2, N3, N4) :-
    N3 == N1 -> N4 = N2 ; N4 = N3.

renameSym(N1, N2, T1, T2) :-
    T1 = (N1, R) -> T2 = (N2, R) ; T2 = T1.
