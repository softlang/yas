# File _languages/BIPL/Prolog/big-step/evaluate.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Prolog/big-step/evaluate.pro)**
```
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
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BIPL/Prolog/big-step/evaluate.pro',prolog(text))
