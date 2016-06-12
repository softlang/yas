% Return object with the intended ID
getObject(Id & O, Id, O).

% Skip deviating ID
getObject(Id1 & O1, Id2, O2) :-
  Id1 \= Id2,
  getObject(O1, Id2, O2).

% Search among values of key-value pairs
getObject(D, Id, O) :-
  dictToList(D, L),
  unzip(L, _, LV),
  member(V, LV),
  getObject(V, Id, O).

% Search among elements of a list
getObject(L, Id, O) :-
  member(E, L), 
  getObject(E, Id, O).
