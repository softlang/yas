# File _languages/Term/graph/normal.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/graph/normal.pro)**
```
% Graphs are equal if they have the same normal form
graphEq(D1, D2) :-
  graphNf(D1, D),
  graphNf(D2, D).

% Start normalization with empty mapping
graphNf(D1, D2) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Term/graph/normal.pro',prolog(text))
