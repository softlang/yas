% BEGIN ...
:- module(btlBigstep, []).
% END ...
evaluate(true, true).
evaluate(false, false).
evaluate(zero, zero).
evaluate(succ(T), succ(N)) :-
  evaluate(T, N),
  isNat(N).
evaluate(pred(T), zero) :-
  evaluate(T, zero).
evaluate(pred(T), N) :-
  evaluate(T, succ(N)),
  isNat(N).
evaluate(iszero(T), true) :-
  evaluate(T, zero).
evaluate(iszero(T), false) :-
  evaluate(T, succ(N)),
  isNat(N).
evaluate(if(T0, T1, _T2), V1) :-
  evaluate(T0, true),
  evaluate(T1, V1).
evaluate(if(T0, _T1, T2), V2) :-
  evaluate(T0, false),
  evaluate(T2, V2).
