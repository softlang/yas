% BEGIN ...
:- module(bfplExpr, []).
% END ...
% An int constant is of the int type
ok(_, _, intconst(_), int).

% The context provides the type of an argument name 
ok(_, X, arg(N), T) :-
  member((N, T), X).

% Condition is of boolean type; others are of the same type 
ok(P, X, if(E1, E2, E3), T) :-
  ok(P, X, E1, bool),
  ok(P, X, E2, T),
  ok(P, X, E3, T).
 
% Check operator application
ok(P, X, binary(O, E1, E2), T0) :-
  ok(P, X, E1, T1),
  ok(P, X, E2, T2),
  bfplOp:ok(O, T1, T2, T0).

% ok function application
ok(P, X, apply(N, Es), T) :-
  map(bfplExpr:ok(P, X), Es, Ts),
  member((N, (Ts, T), _), P).
