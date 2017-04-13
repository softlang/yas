# File _languages/Ueber/ueberEq.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberEq.pro)**
```
% BEGIN ...
:- module(ueberEq, []).
% END ...
compare(R, Pred, Ds, F, L, Expected1, Actual1) :-
  ueberNorm:normalize(Ds, F, L, Actual1, Actual2),
  ( Expected1 = [Expected2] ->
      once((
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Ueber/ueberEq.pro',prolog(text))
