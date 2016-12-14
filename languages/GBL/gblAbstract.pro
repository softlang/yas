% BEGIN ...
:- module(gblAbstract, []).

% END ...
world:Persons1 => { class : world, persons : Persons2 } :-
  map(gblAbstract:(=>), Persons1, Persons2).

