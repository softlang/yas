% BEGIN ...
:- module(btlTyping, []).
% END ...
% BTL types
isType(nat).
isType(bool).

% BEGIN ...
% A well-typed term is of some type
ok(T) :- typeOf(T, _).

% END ...
% Type of a term
typeOf(true, bool).
typeOf(false, bool).
typeOf(zero, nat).
typeOf(succ(T), nat) :-
  typeOf(T, nat).
typeOf(pred(T), nat) :-
  typeOf(T, nat).
typeOf(iszero(T), bool) :-
  typeOf(T, nat).
typeOf(if(T0, T1, T2), Ty) :-
  typeOf(T0, bool),
  typeOf(T1, Ty),
  typeOf(T2, Ty).
