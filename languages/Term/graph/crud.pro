% Test a key to be present in an object
key(K, _&D) :-
  key(K, D).

% Look up a value for a key from an object
lookup(K, _&D, V) :-
  lookup(K, D, V).

% graphToList/2 with permutation on result list
permute(_&D, L) :-
  permute(D, L).

% Add a key-value pair to an object
add(K, V, Id&D1, Id&D2) :-
  add(K, V, D1, D2).

% Update an object with a key-value pair
update(K, V, Id&D1, Id&D2) :-
  update(K, V, D1, D2).

% Remove a key-value pair from a dictionary
remove(K, Id&D1, Id&D2) :-
  remove(K, D1, D2).
