% BEGIN ...
% Static scope for both variables and procedures
:- module(eiplTyping, []).
% END ...
% Begin with no procedures and an empty store
main(Scope) :- scope(Scope, 0, [], []).

% Type-check scope
scope((Ds, Stm), L1, Ps1, Vs1) :-
  L2 is L1 + 1,
  declare(L2, Ds, Ps1, Ps2, Vs1, Vs2),
  check(Stm, L2, Ps2, Vs2).

% A skip statement completes trivially
check(skip, _, _, _). 

% An assignment modifies the store
check(assign(N, E), L, _, Vs) :-
  typeOf(Vs, E, T), 
  lookup1st(N, Vs, (_, T)).

% Sequential composition
check(seq(S1, S2), L, Ps, Vs) :-
  check(S1, L, Ps, Vs),
  check(S2, L, Ps, Vs).
  
% If-then-else
check(if(E, S1, S2), L, Ps, Vs) :-
  typeOf(E, Vs, bool), 
  check(S1, L, Ps, Vs),
  check(S2, L, Ps, Vs).

% Rephrase while statement to rely on "if"
check(while(E, S), L, Ps, Vs) :-
  check(if(E, block([S, while(E, S)]), skip), L, Ps, Vs).

% Execute scope
check(scope(Scope), L, Ps, Vs) :-
  scope(Scope, L, Ps, Vs).

% Execute call
check(call(N), _, Ps, _) :-
  lookup1st(N, Ps, _).

% Write output
check(write(E), _, _, Vs) :-
  typeOf(Vs, E, _).

% Handle lists of declarations
declare(_, [], Ps, Ps, Vs, Vs).  
declare(L, [D|Ds], Ps1, Ps3, Vs1, Vs3) :-  
  declare(L, D, Ps1, Ps2, Vs1, Vs2),
  declare(L, Ds, Ps2, Ps3, Vs2, Vs3).

% Declare a variable
declare(L, var(N, E), Ps, Ps, Vs1, Vs2) :-
  \+ lookup1st(N, Vs1, (L, _)),
  typeOf(Vs, E, T),
  prepend(N, (L, T), Vs1, Vs2).

% Declare a procedure
declare(L, proc(N, _), Ps1, Ps2, Vs, Vs) :-
  \+ lookup1st(N, Ps1, L),
  prepend(N, L, Ps1, Ps2).

% An int constant is of the int type
typeOf(_, intconst(_), int).

% The context provides the type of an argument name 
typeOf(Vs, var(N), T) :-
  lookup1st(N, Vs, T).

% Check operator application
typeOf(Vs, binary(O, E1, E2), T0) :-
  typeOf(Vs, E1, T1),
  typeOf(Vs, E2, T2),
  binop(O, T1, T2, T0).

% Types of binary operators
binop(add, int, int, int).
binop(sub, int, int, int.
binop(mul, int, int, int).
binop(geq, int, int, bool).
