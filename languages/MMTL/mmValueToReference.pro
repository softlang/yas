% BEGIN ...
:- module(mmValueToReference, []).
% END ...
transform(N1, N2, N3, N4, Cs1, Cs2) :-
  append(Cs1a, [class(A, N1, E, Ms1)|Cs1b], Cs1),
  append(Ms1a, [(value, N2, TN, Card)|Ms1b], Ms1),
  append(Ms1a, [(reference, N2, N3, Card)|Ms1b], Ms2),
  append(Cs1a, [class(A, N1, E, Ms2)|Cs1b], Cs2),
  member(class(_, N3, _, Ms3), Cs1),
  member((value, N4, TN, one), Ms3).
