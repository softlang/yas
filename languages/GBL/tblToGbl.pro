% BEGIN ...
:- module(tblToGbl, []).

% END ...
% Map TBL to GBL worlds
World1 => World2 :- 
  lookup(persons, World1, Ps1),
  map(tblToGbl:person(Ps1), Ps1, Ps2),
  update(persons, Ps2, World1, World2).

% Map TBL to GBL persons
person(Ps, Id&P1, Id&P2) :- person(Ps, P1, P2).
person(Ps, P1, P2) :-
  lookup(buddy, P1, Buddy),
  ( Buddy = [Name] ->
      ( member(Id&P3, Ps),
        lookup(name, P3, Name),
        update(buddy, [#Id], P1, P2) ) ;
      P2 = P1 ).
