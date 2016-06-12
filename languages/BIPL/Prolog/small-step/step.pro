% BEGIN ...
:- module(biplStep, []).
% END ...
% An assignment modifies the store
step((assign(X, E), Sto1), (skip, Sto2)) :-
  biplEvaluate:evaluate(E, Sto1, V), 
  insupd(X, V, Sto1, Sto2).

% Make a step with the first statement in a sequence
step((seq(S1, S2), Sto1), (seq(S3, S2), Sto2)) :-
  step((S1, Sto1), (S3, Sto2)).

% Continue with second statement in a sequence for skip as first statement
step((seq(skip, S), Sto), (S, Sto)).

% Execute then branch for true condition
step((if(E, S1, _), Sto), (S1, Sto)) :-
  biplEvaluate:evaluate(E, Sto, boolval(true)).

% Execute else branch for true condition
step((if(E, _, S2), Sto), (S2, Sto)) :-
  biplEvaluate:evaluate(E, Sto, boolval(false)).

% Rephrase while statement to rely on "if"
step((while(E, S), Sto), (if(E, seq(S, while(E, S)), skip), Sto)).
