% BEGIN ...
:- module(efplTyping, []).
% Well-typedness based on attempted type inference
okProg(P) :- okProg(P, _).
% END ...
% Type inference for programs
okProg((Fs1, E), (Fs2, E)) :-
    map(project(1), Fs1, Xs), set(Xs), % Distinct function names
    map(efplTyping:okFun(Fs1), Fs1, Fs2), % Well-typed functions
    okExpr(Fs1, [], E, _). % Well-typed main expression

% Type checking for functions
okFun(P, F1, F2) :-
    F1 = (X, Ts, Xs, E),	
    F2 = (X, [T1], Xs, E), set(Xs),
    (Ts = [T1]; Ts = []),     
    formal(T1, Xs, M, T2),
    okExpr(P, M, E, T2),
    ground(M), ground(T2).

% Build formal argument context
formal(T, [], [], T).
formal(fun(T1, T2), [X|Xs], [(X, T1)|M], T3) :- formal(T2, Xs, M, T3).

% An int constant is of the int type
okExpr(_, _, intconst(_), int).

% An argument name is of the type assigned by the context 
okExpr(_, M, name(X), T) :- member((X, T), M).

% The type of a function
okExpr(P, M, name(X), T2) :-
    \+ member((X, _), M),
    ( member((X, [T1], _, _), P), efplAlpha:convert(T1, T2)
    ; member((X, [], _, _), P) ).

% The type of a function application
okExpr(P, M, apply(E, Es), T2) :-
    okExpr(P, M, E, T1),
    map(efplTyping:okExpr(P, M), Es, Ts),
    actual(T1, Ts, T2).

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
% END ...

% Matching of formal and actual argument types
actual(T, [], T).
actual(fun(T1, T2), [T1|Ts], T3) :- actual(T2, Ts, T3).
