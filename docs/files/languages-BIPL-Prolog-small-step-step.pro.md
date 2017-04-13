# File _languages/BIPL/Prolog/small-step/step.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Prolog/small-step/step.pro)**
```
% BEGIN ...
:- module(biplStep, []).
% END ...
% An assignment modifies the store
step((assign(X, E), Sto1), (skip, Sto2)) :-
  biplEvaluate:evaluate(E, Sto1, V), 
  insupd(X, V, Sto1, Sto2).
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BIPL/Prolog/small-step/step.pro',prolog(text))
