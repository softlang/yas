# File _languages/MMDL/mmdlApply.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MMDL/mmdlApply.pro)**
```
:- module(mmdlApply, []).

apply(sequ([]), Mm, Mm).
apply(sequ([D|Ds]), Mm1, Mm3) :-
    apply(D, Mm1, Mm2),
    apply(sequ(Ds), Mm2, Mm3).
apply(removeClassifier(C), Cs1, Cs2) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MMDL/mmdlApply.pro',prolog(text))
