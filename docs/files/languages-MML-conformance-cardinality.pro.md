# File _languages/MML/conformance/cardinality.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/conformance/cardinality.pro)**
```
% Conformance for "[1-1]"
cardinalityConforms(One, P, V) :-
  permute(One, [ (class, one) ]),
  apply(P, [V]).

% Conformance for "[*]"
cardinalityConforms(Star, P, V) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MML/conformance/cardinality.pro',prolog(text))
