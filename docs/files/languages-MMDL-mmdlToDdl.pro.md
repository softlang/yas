# File _languages/MMDL/mmdlToDdl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MMDL/mmdlToDdl.pro)**
```
:- module(mmdlToDdl, []).

apply(sequ([]), Dd, Dd).
apply(sequ([D|Ds]), Dd1, Dd3) :-
    apply(D, Dd1, Dd2),
    apply(sequ(Ds), Dd2, Dd3).

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MMDL/mmdlToDdl.pro',prolog(text))
