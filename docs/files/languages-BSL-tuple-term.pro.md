# File _languages/BSL/tuple-term.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/tuple-term.pro)**
```
% A term is pair of a symbol and a list of subterms.
tupleTerm((Symbol, Terms)) :-
  atom(Symbol),
  map(tupleTerm, Terms).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BSL/tuple-term.pro',prolog(text))
