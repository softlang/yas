% Replace atom-typed reference by actual reference
atomToRefM(
  From, % Referring objects
  To, % Referred objects
  KRef, % Key for reference on "From" objects
  KId, % Corresponding key on "To" objects
  M1, % Input model
  M3 % Output model
 ) :-
      graphNf(M1, M2), % All objects have IDs
      topdownGraph( % Iterate over the object
        atomToRefM_(From, To, KRef, KId, M2),
        M2, M3).

% Per-object logic
atomToRefM_(
  From, To, KRef, KId, % As before
  R, % Root of the graph
  O1, O2) 
 :-
    apply(From, [O1]),
    lookup(KRef, O1, V1),
    applyOrMap(
      derefAtom_(To, KId, R),
      V1, V2),
    update(KRef, V2, O1, O2). 

% Dereference atom
derefAtom_(To, KId, R, A, Ref) :-
  searchGraph(
    derefAtom_(To, KId, A),
    R, Id&_),
  Ref = (#Id).

% Per-object logic
derefAtom_(To, KId, A1, O) :-
  apply(To, [O]),
  lookup(KId, O, A2),
  A1 == A2.
