% BEGIN ...
:- module(efplInference, []).

% Well-typedness including test for type inference
okProg(P) :- inferProg(P, _).

% Type inference for programs
inferProg((Fs1, E), (Fs2, E)) :-
  map(efplInference:toFunName, Fs1, Xs),
  set(Xs),
  map(efplInference:inferFun(Fs1), Fs1, Fs2),
  okExpr(Fs1, [], E, _).

% Extract function name
toFunName((X, _, _, _), X).

% END ...
% Type checking for functions with signature
inferFun(P, F, F) :-
  F = (_, [T1], Xs, E),
  set(Xs),
  formal(T1, Xs, M, T2),
  okExpr(P, M, E, T2).

% Type inference for functions without signature
inferFun(P, F1, F2) :-
  F1 = (X, [], Xs, E),
  F2 = (X, [T1], Xs, E),
  set(Xs),
  formal(T1, Xs, M, T2),
  okExpr(P, M, E, T2),
  ground(M),
  ground(T2).

% BEGIN ...
% Build formal argument context
formal(T, [], [], T).
formal(fun(T1, T2), [X|Xs], [(X, T1)|M], T3) :-
  formal(T2, Xs, M, T3).

% An int constant is of the int type
okExpr(_, _, intconst(_), int).

% END ...
% The context provides the type of an argument name 
okExpr(_, M, name(X), T) :-
  member((X, T), M).

% The type of function is looked up
okExpr(P, M, name(X), T2) :-
  \+ member((X, _), M),
  member((X, [T1], _, _), P),
  alphaType(T1, T2).

% Missing signature is compensated for
okExpr(P, M, name(X), T2) :-
  \+ member((X, _), M),
  member((X, [], _, _), P).

% Other expression forms omitted
% ...
% BEGIN ...
% Condition is of boolean type; others are of the same type 
okExpr(P, M, if(E1, E2, E3), T) :-
  okExpr(P, M, E1, bool),
  okExpr(P, M, E2, T),
  okExpr(P, M, E3, T).
 
% Check operator application
okExpr(P, M, binary(O, E1, E2), T0) :-
  okExpr(P, M, E1, T1),
  okExpr(P, M, E2, T2),
  bfplOp:ok(O, T1, T2, T0).

% Check function application
okExpr(P, M, apply(E, Es), T2) :-
  okExpr(P, M, E, T1),
  map(efplInference:okExpr(P, M), Es, Ts),
  actual(T1, Ts, T2).

% Compare actual with formal argument types
actual(T, [], T).
actual(fun(T1, T2), [T1|Ts], T3) :-
  actual(T2, Ts, T3).
% END ...
