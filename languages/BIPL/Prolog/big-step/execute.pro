% BEGIN ...
:- module(biplBigstep, []).
% END ...
% Begin with an empty store if no store is provided
execute(S, Sto) :- execute(S, [], Sto).

% A skip statement completes trivially
execute(skip, Sto, Sto). 

% An assignment modifies the store
execute(assign(X, E), Sto1, Sto2) :-
  biplEvaluate:evaluate(E, Sto1, V), 
  insupd(X, V, Sto1, Sto2).

% Execute sequential composition in given order
execute(seq(S1, S2), Sto1, Sto3) :-
  execute(S1, Sto1, Sto2),
  execute(S2, Sto2, Sto3).

% Execute then branch for true condition
execute(if(E, S1, _), Sto1, Sto2) :-
  biplEvaluate:evaluate(E, Sto1, boolval(true)), 
  execute(S1, Sto1, Sto2).

% Execute else branch for true condition
execute(if(E, _, S2), Sto1, Sto2) :-
  biplEvaluate:evaluate(E, Sto1, boolval(false)), 
  execute(S2, Sto1, Sto2).

% Rephrase while statement to rely on "if"
execute(while(E, S), Sto1, Sto2) :-
  execute(if(E, seq(S, while(E, S)), skip), Sto1, Sto2).
