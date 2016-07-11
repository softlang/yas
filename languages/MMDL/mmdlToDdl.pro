:- module(mmdlToDdl, []).

apply(sequ([]), Dd, Dd).
apply(sequ([D|Ds]), Dd1, Dd3) :-
    apply(D, Dd1, Dd2),
    apply(sequ(Ds), Dd2, Dd3).

% Cover here only simple case of addMember/2
apply(addMember(N, M), Ts1, Ts2) :-
    append(Ts1a, [T1|Ts1b], Ts1),
    T1 = (N, Cs1),
    mmlToDdl:singleToColumn(M, [C]),
    append(Cs1, [C], Cs2),
    T2 = (N, Cs2),
    append(Ts1a, [T2|Ts1b], Ts2).
