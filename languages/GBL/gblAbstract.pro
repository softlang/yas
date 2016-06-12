 BEGIN ...
:- module(gblAbstract, []).

% END ...
world:EslPersons => { class : world, persons : Persons } :-
  map(gblAbstract:(=>), TreePersons, TreePersons).


