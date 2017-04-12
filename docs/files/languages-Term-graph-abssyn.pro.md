# File _languages/Term/graph/abssyn.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term/graph/abssyn.pro)**
```
:- op(1200, xfx, (&)).
:- op(500, fx, (#)).

% Well-formedness of graphs
graph(O) :- 
  graph(O, Defs, Uses1),
  set(Defs),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Term/graph/abssyn.pro',prolog(text))
