% Chase members along super chain
chaseSuper(MM, Super, L) :-
  chaseSuper_(MM, [], Super, L).

% Chase finished when super is missing
chaseSuper_(_, _, [], []).

% Continue chase for members
chaseSuper_(MM, Supers, [#Super1], L3) :-
  % Terminate in case of cycle
  \+ member(Super1, Supers),
  getObject(MM, Super1, O),
  lookup(members, O, L1),
  lookup(super, O, Super2),
  chaseSuper_(MM, [Super1|Supers], Super2, L2),
  append(L1, L2, L3).
