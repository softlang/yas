# File _languages/EGTL/egtlInterpret.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/egtlInterpret.pro)**
```
:- module(egtlInterpret, []).

interpret(sequ([]), G, G).

interpret(sequ([T|Ts]), G1, G3) :-
    interpret(T, G1, G2),
    interpret(sequ(Ts), G2, G3).
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EGTL/egtlInterpret.pro',prolog(text))
