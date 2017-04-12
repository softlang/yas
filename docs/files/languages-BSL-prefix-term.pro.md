# File _languages/BSL/prefix-term.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/prefix-term.pro)**
```
% A term consists of a symbol and a list of subterms.
prefixTerm(Term) :-
  Term =.. [Symbol|Terms],
  atom(Symbol),
  map(prefixTerm, Terms).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BSL/prefix-term.pro',prolog(text))
