% Instantiate a class
newObject(ClassN, MM1, Obj2) :-
  newObject_(ClassN, MM1, Obj1),
  graphNf(Obj1, Obj2),
  relaxMm(MM1, MM2),
  require(
    inconsistentNewObject(ClassN),
    conforms(Obj2, MM2)
  ).

% Instantiation helper
newObject_(ClassN, MM, Obj) :-
  lookupConcreteClass(ClassN, MM, Class),
  lookup(members, Class, Ms),
  map(newMember, Ms, Fs),
  listToGraph([(class, ClassN)|Fs], Obj).

% Per-member logic
newMember(Member, (MemberN, [])) :-
  lookup(name, Member, MemberN).
