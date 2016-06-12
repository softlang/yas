% Test a key to be present in a dictionary
key(K, D) :- 
  dictToList(D, L),
  member((K, _), L).

% Look up a value for a key from a dictionary
lookup(K, D, V1) :- 
  dictToList(D, L),
  require(
    keyNotPresent(K),
    member((K, V2), L)),
  V1 = V2.

% dictToList/2 with permutation on result list
permute(D, L2) :-
  dictToList(D, L1),
  unzip(L1, KL1, _),
  unzip(L2, KL2, _),
  require(
    keysNotEqual,
    setEq(KL1, KL2)),
  map(flip(member, L1), L2).

% Add a key-value pair to a dictionary
add(K, V, D1, D2) :-
  dictToList(D1, L),
  require(
    keyPresent(K),
    \+ member((K, _), L)),
  listToDict([(K, V)|L], D2).

% Update a dictionary with a key-value pair
update(K, V, D1, D2) :-
  dictToList(D1, L1),
  require(
    keyNotPresent(K),
    append(L2, [(K, _)|L3], L1)),
  append(L2, [(K, V)|L3], L4),
  listToDict(L4, D2).

% Remove a key-value pair from a dictionary
remove(K, D1, D2) :-
  dictToList(D1, L1),
  require(
    keyNotPresent(K),
    append(L2, [(K, _)|L3], L1)),
  append(L2, L3, L4),
  listToDict(L4, D2).
