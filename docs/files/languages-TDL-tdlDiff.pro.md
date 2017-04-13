# File _languages/TDL/tdlDiff.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TDL/tdlDiff.pro)**
```
:- module(tdlDiff, []).

diff(X, X, id).
diff(X, Y, replace(X, Y)) :-
    \+ X = Y,
    \+ is_list(X),
    \+ is_list(Y),
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/TDL/tdlDiff.pro',prolog(text))
