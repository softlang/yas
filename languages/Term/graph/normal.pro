% Graphs are equal if they have the same normal form
graphEq(D1, D2) :-
  graphNf(D1, D),
  graphNf(D2, D).

% Start normalization with empty mapping
graphNf(D1, D2) :-
  graphNf(D1, D2, (0, []), _).

% Re-assign ID to object and normalize it
graphNf((Id1&D1), (Id2&D2), M1, M3) :-
  idNf(Id1, Id2, M1, M2),
  dictNf(D1, D2, M2, M3).

% Assign ID to object and normalize it
graphNf(D1, (Id1&D2), M1, M3) :-
  \+ D1 = (_&_),
  nextIdNf(Id1, M1, M2),
  dictNf(D1, D2, M2, M3).

% Normalize dictionaries
dictNf(D1, D2, M1, M2) :-
  dictToList(D1, L1),
  sort(L1, L2),
  unzip(L2, KL, VL1),
  seq(valueNf, VL1, VL2, M1, M2),
  zip(KL, VL2, L3),
  listToDict(L3, D2).

% Normalize a single value
valueNf(V1, V2, M1, M2) :-
  singleNf(V1, V2, M1, M2).

% Normalize a list
valueNf(L1, L2, M1, M2) :-
  is_list(L1),
  seq(singleNf, L1, L2, M1, M2).

% Normalize a single value
singleNf(V, V, M, M) :- atomic(V).
singleNf(#Id1, #Id2, M1, M2) :- idNf(Id1, Id2, M1, M2).
singleNf(D1, D2, M1, M2) :-
    \+ D1 = (#_), 
    graphNf(D1, D2, M1, M2).

% Lookup NF for ID
idNf(Id1, Id2, M, M) :-
  M = (_, X),
  member((Id1,Id2), X).

% Add a NF for ID
idNf(Id1, Id2, M1, M2) :-
  M1 = (Id2, X),
  \+ member((Id1,_), X),
  Id3 is Id2 + 1,
  M2 = (Id3, [(Id1,Id2)|X]).

% Generate next ID
nextIdNf(Id1, M1, M2) :-
  M1 = (Id1, X),
  Id2 is Id1 + 1,
  M2 = (Id2, X).
