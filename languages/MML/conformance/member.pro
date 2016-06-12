% Conformance for values
memberConforms(_, _, V, value, Type, Times) :-
  lookup(class, Type, datatype),
  lookup(name, Type, Name1),
  mml2pro(Name1, Name2),
  cardinalityConforms(Times, Name2, V).

% Conformance for parts
memberConforms(M, MM, V, part, Type, Times) :-
  lookup(class, Type, class),
  lookup(name, Type, Name),  
  cardinalityConforms(
    Times,
    flip(objectConforms(M, MM), Name), V).

% Conformance for references
memberConforms(M, MM, V, reference, Type, Times) :-
  lookup(class, Type, class),
  lookup(name, Type, Name),  
  cardinalityConforms(
    Times,
    flip(refConforms(M, MM), Name), V).

% Deref and check class but not members
refConforms(M, MM, #Id, N1) :-
  getObject(M, Id, O),
  lookup(class, O, N2),
  subclassOf(MM, N2, N1).
