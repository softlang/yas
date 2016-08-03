% BEGIN ...
:- module(btlSmallStep, [step/2]).
% END ...
step(succ(E1), succ(E2)) :- step(E1, E2).
step(pred(E1), pred(E2)) :- step(E1, E2).
step(pred(zero), zero).
step(pred(succ(N)), N) :- isNat(N).
step(iszero(E1), iszero(E2)) :- step(E1, E2).
step(iszero(zero), true).
step(iszero(succ(N)), false) :- isNat(N).
step(if(E0a, E1, E2), if(E0b, E1, E2)) :- step(E0a, E0b).
step(if(true, E1, _E2), E1).
step(if(false, _E1, E2), E2).
