% Runtime table for metamodels
:- dynamic metamodel/2.

% Load a metamodel into memory 
loadMetamodel(File) :-
  readTermFile(File, Mm),
  require(
    invalidMetamodel,
    metamodel(Mm)
  ),
  lookup(name, Mm, Name),
  \+ metamodel(Name, _),
  assertz(metamodel(Name, Mm)).
