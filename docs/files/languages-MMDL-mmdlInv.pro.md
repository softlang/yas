# File _languages/MMDL/mmdlInv.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MMDL/mmdlInv.pro)**
```
:- module(mmdlInv, []).

inv(sequ(Ds1), sequ(Ds2)) :-
    map(mmdlInv:inv, Ds1, Ds2).
inv(removeClassifier(C), addClassifer(C)).
inv(removeMember(CN, M), addMember(CN, M)).
inv(addClassifier(C), removeClassifier(C)).
inv(addMember(CN, M), removeMember(CN, M)).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MMDL/mmdlInv.pro',prolog(text))
