# File _languages/Term/graph/search.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/graph/search.pro)**
```
% Search graph for object of interest 
searchGraph(S, O1, O2) :-
  searchObject(S, O1, O2).

searchObject(S, O1, O2) :-
  apply(S, [O1]) ->
      O2 = O1
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Term/graph/search.pro',prolog(text))
