% BEGIN ...
% Dynamic scope for variables; static scope for procedures
:- module(eiplMixed, []).
% END ...
% BEGIN ...
% Begin with no procedures and an empty store
main(Scope, Out) :- scope(Scope, [], [], _, Out).

% Execute scope
scope((Ds, Stm), Ps1, Sto1, Sto4, Out) :-
  declare(Ds, Ps1, Ps2, Sto1, Sto2),
  execute(Stm, Ps2, Sto2, Sto3, Out),
  undeclare(Ds, Ps2, Ps1, Sto3, Sto4).

% A skip statement completes trivially
execute(skip, _, Sto, Sto, []). 

% An assignment modifies the store
execute(assign(N, E), _, Sto1, Sto2, []) :-
  biplEvaluate:evaluate(E, Sto1, V), 
  update(N, V, Sto1, Sto2).

% Sequential composition
execute(seq(S1, S2), Ps, Sto1, Sto3, Out3) :-
  execute(S1, Ps, Sto1, Sto2, Out1),
  execute(S2, Ps, Sto2, Sto3, Out2),
  append(Out1, Out2, Out3).
  
% Execute then branch for true condition
execute(if(E, S1, _), Ps, Sto1, Sto2, Out) :-
  biplEvaluate:evaluate(E, Sto1, boolval(true)), 
  execute(S1, Ps, Sto1, Sto2, Out).

% Execute else branch for true condition
execute(if(E, _, S2), Ps, Sto1, Sto2, Out) :-
  biplEvaluate:evaluate(E, Sto1, boolval(false)), 
  execute(S2, Ps, Sto1, Sto2, Out).

% Rephrase while statement to rely on "if"
execute(while(E, S), Ps, Sto1, Sto2, Out) :-
  execute(if(E, block([S, while(E, S)]), skip), Ps, Sto1, Sto2, Out).

% Execute scope
execute(scope(Scope), Ps, Sto1, Sto2, Out) :-
  scope(Scope, Ps, Sto1, Sto2, Out).
% END ...  
% Execute call
execute(call(N), Ps1, Sto1, Sto2, Out) :-
  lookup1st(N, Ps1, (Ps2, S)),
  execute(S, Ps2, Sto1, Sto2, Out).
% BEGIN ...
% Write output
execute(write(E), _, Sto, Sto, [V]) :-
  biplEvaluate:evaluate(E, Sto, V).

% Handle lists of declarations
declare([], Ps, Ps, Sto, Sto).  
declare([D|Ds], Ps1, Ps3, Sto1, Sto3) :-  
  declare(D, Ps1, Ps2, Sto1, Sto2),
  declare(Ds, Ps2, Ps3, Sto2, Sto3).
% END ...
% Declare a variable
declare(var(N, E), Ps, Ps, Sto1, Sto2) :-
  biplEvaluate:evaluate(E, Sto1, V), 
  prepend(N, V, Sto1, Sto2).

% Declare a procedure
declare(proc(N, S), Ps1, Ps2, Sto, Sto) :-
  prepend(N, (Ps1, S), Ps1, Ps2).
