% Remove a subobject
removeObject(MM1, Id, Obj1, Obj3) :-
  topdownGraph(
    removeObject_(Id),
      Obj1, Obj2),
  require(
    missingId(Id),
    Obj1 \= Obj2),
  graphNf(Obj2, Obj3),
  relaxMetamodel(MM1, MM2),
  require(
    inconsistentRemoveObject(Id),
    conforms(Obj3, MM2)
  ).

% Per-object logic
removeObject_(Id, Obj1, Obj2) :-
  graphToList(Obj1, L1, Q),
  append(L2, [(K, V1)|L3], L1),
  append(V2, [(Id&_)|V3], V1),
  append(V2, V3, V4),
  append(L2, [(K, V4)|L3], L4),
  apply(Q, [L4, Obj2]).
