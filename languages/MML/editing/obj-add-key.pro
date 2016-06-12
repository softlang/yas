% Add a key with value "[]" to certain objects
addKey(
  P, % Predicate for object selection
  Key, % Key to be inserted
  O1, O2)
 :-
    topdownGraph(
      addKey_(P, Key, O1),
      O1, O2).

% Per-object logic
addKey_(
  P, % Predicate for selection of objects
  Key, % Key to be inserted
  R, % Root of graph
  O1, O2)
 :-
    apply(P, [R, O1]),
    add(Key, [], O1, O2).
