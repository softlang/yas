% BEGIN ...
:- module(termToGraph, []).

% END ...
% Map term-based to graph-based representation
Cs1 => { class : metamodel, classifiers : Cs2 } :-
  map(termToGraph:mapClassifier, Cs1, Cs2).

% Map classifiers
mapClassifier(
  class(Abstr, Name, SuperT, Ts),
  Name &
  { class : class,
    name : Name,
    abstract : Abstr,
    super : SuperG,
    members : Gs }) :-
  mapSuper(SuperT, SuperG),
  map(termToGraph:mapMember, Ts, Gs).

mapClassifier(
  datatype(Name),
  Name & { class : datatype, name : Name }).

% Map "super"
mapSuper([], []).
mapSuper([Name], [#Name]).

% Map member
mapMember(
  (Kind, Name, Type, Card),
  { class : Kind,
    name : Name,
    type : # Type,
    cardinality : { class : Card } }).
