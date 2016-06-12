% BEGIN ...
:- module(mmlTree, []).
% END ...
metamodel(Classifiers) :-
  map(mmlTree:classifier, Classifiers).

classifier(datatype(_)).
classifier(class(_, _, _, Members)) :-
  map(mmlTree:member, Members).

member((value, _, _, _)).
member((part, _, _, _)).
