# File _languages/TDL/tdlInv.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TDL/tdlInv.pro)**
```
:- module(tdlInv, []).

inv(id, id).
inv(replace(X, Y), replace(Y, X)).
inv(subterms(Ds1), subterms(Ds2)) :-
    map(tdlInv:inv, Ds1, Ds2).
inv(list(Ds1), list(Ds2)) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/TDL/tdlInv.pro',prolog(text))
