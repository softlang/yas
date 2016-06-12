% Well-formedness of dictionaries
dict(D) :-
  dictToList(D, L),
  unzip(L, KL, VL),
  map(atom, KL), % type of keys
  set(KL), % uniqueness of keys
  map(dictValue, VL).

% Single values of key-value pairs
dictValue(V) :-
  singleDictValue(V).

% Lists as values of key-value pairs
dictValue(L) :-
  map(singleDictValue, L).

% Numbers or atoms
singleDictValue(V)
  :- atomic(V).

% Sub-dictionaries
singleDictValue(D)
  :- dict(D).
