% BEGIN ...
:- module(elAbstract, []).
% END ...
% Eliminate bracketing
(_, brackets(E)) ~> E.

% Make unary expressions abstract
(factor, E1) ~> E2 :-
  member(F, [negate, not]),
  E1 =.. [F, E1a],
  E2 = unary(F, E1a).
  
% Make binary expressions abstract
(N, E1) ~> E2 :-
  member(N, [expr, bexpr, cexpr, aexpr, term]),
  member(F, [and, or, lt, leq, eq, geq, gt, add, sub, mul]),
  E1 =.. [F, E1a, E1b],
  (E1b = [], E2 = E1a ; E1b = [E1c], E2 = binary(F, E1a, E1c)).

% Lexical mapping for integer
(integer, Digits) ~> Int :- number_codes(Int, Digits).

% Lexical mapping for identifier
(identifier, String) ~> Atom :- name(Atom, String).
