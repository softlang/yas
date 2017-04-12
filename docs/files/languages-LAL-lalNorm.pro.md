# File _languages/LAL/lalNorm.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalNorm.pro)**
```
:- module(lalNorm, []).

Ds1 => Ds3 :-
    map(try(lalNorm:(=>)), Ds1, Ds2),
    list_to_set(Ds2, Ds3).

sort(L, [L]) => sort(L, []).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/LAL/lalNorm.pro',prolog(text))
