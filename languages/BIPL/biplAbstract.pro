% BEGIN ...
:- module(biplAbstract, []).

% END ...
% Map blocks to sequential composition
(_, block(Ss)) ~> S :- block(Ss) ~> S.
block([]) ~> skip.
block([S]) ~> S.
block([S1,S2|Ss]) ~> seq(S1, S3) :- block([S2|Ss]) ~> S3.

% Making optional else part mandatory
(_, if(E, S, [])) ~> if(E, S, skip).
(_, if(E, S1, [S2])) ~> if(E, S1, S2).

% Eliminate bracketing
(_, brackets(E)) ~> E.
% ...
% BEGIN ...
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

% Lexical mapping for name
(name, String) ~> Atom :- name(Atom, String).
% END ...
