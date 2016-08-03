% BEGIN ...
:- module(btlBigstep, []).
% END ...
evaluate(true, true).
evaluate(false, false).
evaluate(zero, zero).
evaluate(succ(E), succ(N)) :-
  evaluate(E, N),
  isNat(N).
evaluate(pred(E), zero) :-
  evaluate(E, zero).
evaluate(pred(E), N) :-
  evaluate(E, succ(N)),
  isNat(N).
evaluate(iszero(E), true) :-
  evaluate(E, zero).
evaluate(iszero(E), false) :-
  evaluate(E, succ(N)),
  isNat(N).
evaluate(if(E0, E1, _E2), V1) :-
  evaluate(E0, true),
  evaluate(E1, V1).
evaluate(if(E0, _E1, E2), V2) :-
  evaluate(E0, false),
  evaluate(E2, V2).
