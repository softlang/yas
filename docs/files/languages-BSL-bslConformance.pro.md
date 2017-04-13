# File _languages/BSL/bslConformance.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/bslConformance.pro)**
```
% BEGIN ...
:- module(bslConformance, []).
% END ...
termOfSort(Profiles, Term, Sort) :-
  Term =.. [Symbol|Terms],
  member((Symbol, Sorts, Sort), Profiles),
  map(bslConformance:termOfSort(Profiles), Terms, Sorts).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BSL/bslConformance.pro',prolog(text))
