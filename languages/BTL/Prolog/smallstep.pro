% BEGIN ...
:- module(btlSmallStep, [step/2]).
% END ...
step(succ(T1), succ(T2)) :- step(T1, T2).
step(pred(T1), pred(T2)) :- step(T1, T2).
step(pred(zero), zero).
step(pred(succ(N)), N) :- isNat(N).
step(iszero(T1), iszero(T2)) :- step(T1, T2).
step(iszero(zero), true).
step(iszero(succ(N)), false) :- isNat(N).
step(if(T0a, T1, T2), if(T0b, T1, T2)) :- step(T0a, T0b).
step(if(true, T1, _T2), T1).
step(if(false, _T1, T2), T2).
