% BEGIN ...
:- module(bfplStep, []).
% END ...
% An assignment modifies the store
% Simplify condition
step(P, if(E1a, E2, E3), if(E1b, E2, E3)) :-
  step(P, E1a, E1b).

% Commit to then branch
step(_, if(boolconst(true), E, _), E).

% Commit to else branch
step(_, if(boolconst(false), _, E), E).

% Simplify left operand
step(P, binary(O, E1a, E2), binary(O, E1b, E2)) :-
  step(P, E1a, E1b).

% Simplify right operand
step(P, binary(O, E1, E2a), binary(O, E1, E2b)) :-
  bfplNormal:normal(E1),
  step(P, E2a, E2b).

% Apply operator
step(_, binary(O, E1, E2), E0) :-
  bfplNormal:normal(E1),
  bfplNormal:normal(E2),
  opConst(O, E1, E2, E0).

% Simplify operand of function application
step(P, apply(F, Es1), apply(F, Es4)) :-
  append(Es2, [E1|Es3], Es1),
  map(bfplNormal:normal, Es2),
  step(P, E1, E2),
  append(Es2, [E2|Es3], Es4).

% Apply function
step(P, apply(N, Es), E2) :-
  map(bfplNormal:normal, Es),
  member((N, _, (Ns, E1)), P),
  zip(Ns, Es, L),
  substitute(L, E1, E2).
