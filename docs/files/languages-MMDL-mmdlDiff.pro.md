# File _languages/MMDL/mmdlDiff.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MMDL/mmdlDiff.pro)**
```
:- module(mmdlDiff, []).

diff(Cs1, Cs2, sequ(Ds)) :-
    classifiers(Cs1, Cs2, Ds).

% Nothing left to diff
classifiers([], [], []).
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MMDL/mmdlDiff.pro',prolog(text))
