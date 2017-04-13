# File _languages/EGTL/egtlGeq.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/egtlGeq.pro)**
```
:- module(egtlGeq, []).

geq((L, N, Ss1), (L, N, Ss2)) :-
    geq(Ss1, Ss2).
geq([], []).
geq([S|Ss1], [S|Ss2]) :-
    geq(Ss1, Ss2).
geq([option(Ss1)|Ss2], Ss3) :-
    append(Ss1, Ss4, Ss3),
    geq(Ss2, Ss4).
% ...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EGTL/egtlGeq.pro',prolog(text))
