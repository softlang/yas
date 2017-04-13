# File _languages/BGL/api.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/api.pro)**
```
% BGL-based conformance for token sequences
bglConformance(Input, Grammar) 
 :-
    once(bglAcceptTopDown:accept(Grammar, Input)).
    
% BGL-based top-down acceptor for token sequences
bglAcceptor(File, Input) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BGL/api.pro',prolog(text))
