% Conformance of model to a metamodel
conforms(M, MM) :-
  require(
    graphMissing,
    graph(M)),
  require(
    metamodelMissing,
    metamodel(MM)),
  lookup(class, M, N),
  objectConforms(M, MM, M, N).

% Object conforms to class
objectConforms(M, MM, O, N1) :-
  lookup(class, O, N2),
  subclassOf(MM, N2, N1),
  lookupClass(N2, MM, Class),
  lookup(members, Class, Lmm1),
  lookup(super, Class, Super),
  chaseSuper(MM, Super, Lmm2),
  append(Lmm1, Lmm2, Lmm3),
  graphToList(O, Lm),
  kvPairsConforms(M, MM, Lm, Lmm3).

% Object and class matched
kvPairsConforms(_, _, [], []).

% Skip "class" member of object
kvPairsConforms(M, MM, [(class, _)|Lm], Lmm) :-
  kvPairsConforms(M, MM, Lm, Lmm).

% Handle relevant member, finally
kvPairsConforms(M, MM, [(K, V)|Lm], Lmm1) :-
  K \= class,
  append(Lmm2, [X|Lmm3], Lmm1),
  permute(X, [
      (name, K),
      (class, Kind),
      (type, #Id),
      (cardinality, Times)
    ]),
  getObject(MM, Id, Type),
  memberConforms(M, MM, V, Kind, Type, Times),
  append(Lmm2, Lmm3, Lmm4),
  kvPairsConforms(M, MM, Lm, Lmm4).
