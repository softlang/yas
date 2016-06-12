% BEGIN ...
% This code does NOT run.
% It was extracted from file inference.pro for presentation so that type inference is simplified to checking.
% Also, all the routine cases (comparable to BFPL) were omitted.
:- module(efplTyping, []).  
% END ...
% Type checking for functions with signature
okFun(Fs, F) :-
  F = (_, T1, Xs, E),
  set(Xs),
  formal(T1, Xs, M, T2),
  okExpr(Fs, M, E, T2).

% Build formal argument context
formal(T, [], [], T).
formal(fun(T1, T2), [X|Xs], [(X, T1)|M], T3) :-
  formal(T2, Xs, M, T3).

% The context provides the type of an argument name 
okExpr(_, M, name(X), T) :-
  member((X, T), M).

% The type of function is looked up
okExpr(Fs, M, name(X), T2) :-
  \+ member((X, _), M),
  member((X, T1, _, _), Fs),
  alphaType(T1, T2).

% Check function application
okExpr(Fs, M, apply(E, Es), T2) :-
  okExpr(Fs, M, E, T1),
  map(okExpr(Fs, M), Es, Ts),
  actual(T1, Ts, T2).

% Other expression forms omitted
% ...

% Compare actual with formal argument types
actual(T, [], T).
actual(fun(T1, T2), [T1|Ts], T3) :-
  actual(T2, Ts, T3).
