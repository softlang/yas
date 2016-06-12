% Alpha conversion for type schemes with logical variables
alphaType(T1, T2) :-
  alphaType([], _, T1, T2).
alphaType(V, V, int, int).
alphaType(V, V, bool, bool).
alphaType(V1, V3, fun(T1, T2), fun(T3, T4)) :-
  alphaType(V1, V2, T1, T3),
  alphaType(V2, V3, T2, T4).
alphaType(V, V, typevar(N), X) :-
  member((N, X), V).
alphaType(V, [(N, X)|V], typevar(N), X) :-
  \+ member((N, _), V).
