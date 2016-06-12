substitute(_, intconst(I), intconst(I)).
substitute(_, boolconst(B), boolconst(B)).
substitute(S, arg(N), E) :- member((N, E), S).
substitute(S, arg(N), arg(N)) :- \+ member((N, _), S).
substitute(S, if(E1a, E2a, E3a), if(E1b, E2b, E3b)) :-
  substitute(S, E1a, E1b),
  substitute(S, E2a, E2b),
  substitute(S, E3a, E3b).
substitute(S, binary(O, Left1, Right1), binary(O, Left2, Right2)) :-
  substitute(S, Left1, Left2),
  substitute(S, Right1, Right2).
substitute(S, apply(F, Es1), apply(F, Es2)) :-
  map(substitute(S), Es1, Es2).
