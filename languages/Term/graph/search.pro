% Search graph for object of interest 
searchGraph(S, O1, O2) :-
  searchObject(S, O1, O2).

searchObject(S, O1, O2) :-
  apply(S, [O1]) ->
      O2 = O1
    ; searchValues(S, O1, O2).

% Skip ID
searchValues(S, _&D, O) :-
  searchValues(S, D, O).

% Search among values
searchValues(S, D, O) :-
  dictToList(D, L),
  unzip(L, _, VL),
  member(V, VL),
  searchValue(S, V, O).

% Search objects
searchValue(S, O1, O2) :-
  searchObject(S, O1, O2).

% Search in lists of objects
searchValue(S, Os, O2) :-
  member(O1, Os),
  searchObject(S, O1, O2).
