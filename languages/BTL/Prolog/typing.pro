% BEGIN ...
:- module(btlTyping, []).
% END ...
% BTL types
isType(nat).
isType(bool).

% BEGIN ...
% A well-typed term is of some type
ok(E) :- typeOf(E, _).

% END ...
% Type of a term
typeOf(true, bool).
typeOf(false, bool).
typeOf(zero, nat).
typeOf(succ(E), nat) :-
  typeOf(E, nat).
typeOf(pred(E), nat) :-
  typeOf(E, nat).
typeOf(iszero(E), bool) :-
  typeOf(E, nat).
typeOf(if(E0, E1, E2), T) :-
  typeOf(E0, bool),
  typeOf(E1, T),
  typeOf(E2, T).
