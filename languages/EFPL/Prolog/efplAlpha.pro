% BEGIN ...
:- module(efplAlpha, []).
% END ...
convert(T1, T2) :- convert([], _, T1, T2).
convert(V, V, int, int).
convert(V, V, bool, bool).
convert(V1, V3, fun(T1, T2), fun(T3, T4)) :-
    convert(V1, V2, T1, T3),
    convert(V2, V3, T2, T4).
convert(V, V, typevar(N), X) :- member((N, X), V).
convert(V, [(N, X)|V], typevar(N), X) :- \+ member((N, _), V).
