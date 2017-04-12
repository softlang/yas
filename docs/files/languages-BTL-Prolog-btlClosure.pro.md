# File _languages/BTL/Prolog/btlClosure.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Prolog/btlClosure.pro)**
```
% BEGIN ...
:- module(btlSmallstep, []).
% END ...
steps(E, E) :- isValue(E).
steps(E1, E3) :- step(E1, E2), steps(E2, E3).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BTL/Prolog/btlClosure.pro',prolog(text))
