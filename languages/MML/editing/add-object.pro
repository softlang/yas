% Add a new subobject
addObject(MM1, Id, Key, ClassN, Obj1, Obj3) :-
  newObject_(MM1, ClassN, Obj0),
  topdownGraph(
    addObject_(Id, Key, Obj0),
      Obj1, Obj2),
  graphNf(Obj2, Obj3),
  relaxMetamodel(MM1, MM2),
  require(
    inconsistentAddObject(ClassN),
    conforms(Obj3, MM2)
  ).

% Per-object logic
addObject_(Id, Key, Obj0, Obj1, Obj2) :-
  Obj1 = (Id&_),
  require(
    missingListValueForKey(Key),
    (
      lookup(Key, Obj1, L1),
      list(L1)
    )),
  append(L1, [Obj0], L2),
  update(Key, L2, Obj1, Obj2).
