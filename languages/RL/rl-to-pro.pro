:- module(rlToPro, []).

main(Pred, Rules, Clauses) :- 
  map(rlToPro:perRule(Pred), Rules, Clauses).

perRule(Pred, Rule, Fact2) :-
  Rule =.. [_, Lhs, Rhs],
  Fact1 =.. [Pred, Lhs, Rhs],
  collect(rlToPro:extractVar, Fact1, Ls),
  list_to_set(Ls, Vs1),
  length(Vs1, Len),
  length(Vs2, Len),
  zip(Vs1, Vs2, Map),
  replace(rlToPro:replaceVar(Map), Fact1, Fact2). 

% Extract ground variable occurrence
extractVar(X, [V]) :-
  X =.. [_,rlvar(V)].

% Replace ground by logical variable representation
replaceVar(Map, X, V2) :-
  X =.. [_,rlvar(V1)],
  member((V1, V2), Map).
