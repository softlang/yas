% BEGIN ...
:- module(biplEvaluate, []).
% END ...
% A constant evaluates to itself
evaluate(intconst(I), _, intval(I)).

% Look-up variable from store
evaluate(var(N), Sto, V) :- lookup1st(N, Sto, V).

% Evaluate operator application
evaluate(binary(O, E1, E2), Sto, V0) :-
  evaluate(E1, Sto, V1),
  evaluate(E2, Sto, V2),
  opVal(O, V1, V2, V0).
