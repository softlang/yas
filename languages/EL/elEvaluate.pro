% BEGIN ...
:- module(elEvaluate, []).
% END ...
/*
   No rule is given for the case of variables.
   An association list could be used to assign values to variables.
   See the language BIPL and BFPL with corresponding expressiveness.
*/
evaluate(intconst(I), intval(I)).
evaluate(boolconst(B), boolval(B)).
evaluate(unary(O, E1), V0) :-
  evaluate(E1, V1),
  elOps:uop(O, V1, V0).
evaluate(binary(O, E1, E2), V0) :-
  evaluate(E1, V1),
  evaluate(E2, V2),
  elOps:bop(O, V1, V2, V0).
