# File _languages/MML/as.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/as.pro)**
```
% Characterization of metamodel terms with lookup (resolution)
metamodel(MM) :-
  require(
    graphMissing,
    graph(MM)),
  permute(MM, [
      (class, metamodel), 
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MML/as.pro',prolog(text))
