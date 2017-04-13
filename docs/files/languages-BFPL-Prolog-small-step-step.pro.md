# File _languages/BFPL/Prolog/small-step/step.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/small-step/step.pro)**
```
% BEGIN ...
:- module(bfplStep, []).
% END ...
% An assignment modifies the store
% Simplify condition
step(P, if(E1a, E2, E3), if(E1b, E2, E3)) :-
  step(P, E1a, E1b).
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BFPL/Prolog/small-step/step.pro',prolog(text))
