:- module(mmlDdl, []).

% Simplicity of metamodels
metamodel(Classifiers) :-
  map(mmlDdl:simpleClassifier, Classifiers).

% Simplicity of classes
simpleClassifier(
  class(
    false, % Concrete classes, only
    Name,
    [], % Classes without super, only
    _ % No constraints on members
  ))
 :-
    \+ datatype(Name).

% Simplicity of datatypes
simpleClassifier(datatype(X)) :-
  datatype(X).

% All known datatypes
datatype(atom).
datatype(integer).
