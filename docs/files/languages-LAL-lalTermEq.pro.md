# File _languages/LAL/lalTermEq.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalTermEq.pro)**
```
:- module(lalTermEq, []).

eq(Lal1, Lal2) :-
    apply(lalNorm:(=>), [Lal1, Lal]),
    apply(lalNorm:(=>), [Lal2, Lal]).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/LAL/lalTermEq.pro',prolog(text))
