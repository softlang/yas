# File _languages/Term/graph/as-to-cs.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/graph/as-to-cs.pro)**
```
% Render graphs
ppGraph(G, S) :-
  once(ppGraph_(text('.'), G, B)),
  pp(B, S).

% Render graphs with IDs
ppGraph_(Post, (Id & Dict), B) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Term/graph/as-to-cs.pro',prolog(text))
