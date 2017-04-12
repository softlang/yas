# File _languages/BFPL/Prolog/small-step/closure.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/small-step/closure.pro)**
```
% BEGIN ...
:- module(bfplSmallstep, []).
% END ...
% Evaluate main expression of program
allSteps((Fs, E1), E2) :-
  allSteps(Fs, E1, E2).

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BFPL/Prolog/small-step/closure.pro',prolog(text))
