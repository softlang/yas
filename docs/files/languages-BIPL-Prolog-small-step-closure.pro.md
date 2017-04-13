# File _languages/BIPL/Prolog/small-step/closure.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Prolog/small-step/closure.pro)**
```
% BEGIN ...
:- module(biplSmallstep, []).
% END ...
% Begin with an empty store if no store is provided
allSteps(S, Sto) :-
  allSteps(S, [], Sto).

...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BIPL/Prolog/small-step/closure.pro',prolog(text))
