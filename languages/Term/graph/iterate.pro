topdownGraph(P, O1, O3) :-
  try(P, O1, O2),
  graphToList(O2, L1, Back),
  unzip(L1, KL, VL1),
  map(topdownValue(P), VL1, VL2),
  zip(KL, VL2, L2),
  apply(Back, [L2, O3]).

% A single value
topdownValue(P, V1, V2) :-
  topdownSingle(P, V1, V2).

% A list of values
topdownValue(P, V1, V2) :-
  map(topdownSingle(P), V1, V2).

% Atomic values
topdownSingle(_, V, V) :-
  atomic(V).

% References
topdownSingle(_, #Id, #Id) :-
  atomic(Id).

% An object as a value
topdownSingle(P, O1, O2) :-
  topdownGraph(P, O1, O2).
