# File _languages/TDL/tdlApply.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TDL/tdlApply.pro)**
```
:- module(tdlApply, []).

apply(id, X, X).
apply(replace(X, Y), X, Y).
apply(subterms(Ds), X, Y) :-
    X =.. [F|Xs],
    map(tdlApply:apply, Ds, Xs, Ys),
...
```
