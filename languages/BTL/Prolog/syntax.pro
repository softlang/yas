% BEGIN ...
:- module(btlSyntax, []).
% END ...
isTerm(true).
isTerm(false).
isTerm(zero).
isTerm(succ(T)) :- isTerm(T).
isTerm(pred(T)) :- isTerm(T).
isTerm(iszero(T)) :- isTerm(T).
isTerm(if(T0, T1, T2)) :- isTerm(T0), isTerm(T1), isTerm(T2).
