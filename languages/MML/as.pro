% Characterization of metamodel terms with lookup (resolution)
metamodel(MM) :-
  require(
    graphMissing,
    graph(MM)),
  permute(MM, [
      (class, metamodel), 
      (classifiers, Cs)
    ]),
  map(classifier(MM), Cs).

% Datatypes as classifiers
classifier(_, C) :-
  lookup(class, C, datatype),
  permute(C, [
      (class, datatype), 
      (name, Name)
    ]),
  atom(Name).

% Classes as classifiers
classifier(MM, C) :-
  lookup(class, C, class),
  permute(C, [
      (class, class), 
      (name, Name),
      (abstract, Abstract),
      (super, Super),
      (members, Members1)
    ]),
  atom(Name),
  boolean(Abstract),
  super(MM, Super),
  map(classMember(MM), Members1),
  chaseSuper(MM, Super, Members2),
  append(Members1, Members2, Members3),
  map(lookup(name), Members3, Names),
  set(Names).

% Optional superclass
super(_, []).
super(MM, [#Id]) :-
  atomic(Id),
  getObject(MM, Id, O),
  lookup(class, O, class).

% Class members
classMember(MM, M) :-
  permute(M, [
      (class, Kind), 
      (name, Name),
      (type, #Id),
      (cardinality, Ca)
    ]),
  member(Kind, [value, part, reference]),
  atom(Name),
  atomic(Id),
  cardinality(Ca),
  memberType(MM, Kind, Id).

% Value members use datatypes
memberType(MM, value, Id) :-
  getObject(MM, Id, O),
  lookup(class, O, datatype).

% Parts and references use classes
memberType(MM, Kind, Id) :-
  member(Kind, [part, reference]),
  getObject(MM, Id, O),
  lookup(class, O, class).

% Extension of cardinality type
cardinality(O) :-
  permute(O, [(class, Class)]),
  member(Class, [one, star, option]).
