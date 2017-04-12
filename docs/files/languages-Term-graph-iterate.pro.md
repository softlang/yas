# File _languages/Term/graph/iterate.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/graph/iterate.pro)**
```
topdownGraph(P, O1, O3) :-
  try(P, O1, O2),
  graphToList(O2, L1, Back),
  unzip(L1, KL, VL1),
  map(topdownValue(P), VL1, VL2),
  zip(KL, VL2, L2),
  apply(Back, [L2, O3]).
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Term/graph/iterate.pro',prolog(text))
