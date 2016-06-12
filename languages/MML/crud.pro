% Look up class by name
lookupClass(ClassN, MM, Class) :-
  lookupClassifier(ClassN, MM, Class),
  lookup(class, Class, class).

% Look up concrete class by name
lookupConcreteClass(ClassN, MM, Class) :-
  lookupClass(ClassN, MM, Class),
  require(
    concreteClassRequired,
    lookup(abstract, Class, false)
  ).

% Look up datatype by name
lookupDatatype(DatatypeN, MM) :-
  lookupClassifier(DatatypeN, MM, Datatype),
  lookup(class, Datatype, datatype).

% Look up classifier by name
lookupClassifier(ClassifierN, MM, Classifier) :-
  lookup(classifiers, MM, Classifiers),
  member(Classifier, Classifiers),
  lookup(name, Classifier, ClassifierN).

% Update classifier
updateClassifier(Classifier1, MM1, MM2) :-
  lookup(name, Classifier1, ClassifierN),
  lookup(classifiers, MM1, Classifiers1),
  append(Classifiers2, [Classifier2|Classifiers3], Classifiers1),
  lookup(name, Classifier2, ClassifierN),
  append(Classifiers2, [Classifier1|Classifiers3], Classifiers4),
  update(classifiers, Classifiers4, MM1, MM2).

% Look up class member
lookupMember(ClassN, MemberN, MM, Member) :-
  lookupClass(ClassN, MM, Class),
  lookup(members, Class, L1),
  member(Member, L1),
  lookup(name, Member, MemberN).

% Update class member
updateMember(ClassN, X, MM1, MM2) :-
  lookup(name, X, MemberN),
  lookupClass(ClassN, MM1, Class1),
  lookup(members, Class1, L1),
  append(L2, [Y|L3], L1),
  lookup(name, Y, MemberN),
  append(L2, [X|L3], L4),
  update(members, L4, Class1, Class2),
  updateClassifier(Class2, MM1, MM2).
