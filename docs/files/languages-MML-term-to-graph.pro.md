# File _languages/MML/term-to-graph.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/term-to-graph.pro)**
```
% BEGIN ...
:- module(termToGraph, []).

% END ...
% Map term-based to graph-based representation
Cs1 => { class : metamodel, classifiers : Cs2 } :-
  map(termToGraph:mapClassifier, Cs1, Cs2).
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/term-to-graph.pro',prolog(text))
