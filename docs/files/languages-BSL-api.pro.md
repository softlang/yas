# File _languages/BSL/api.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/api.pro)**
```
% Conformance for BSL
bslConformance(Term, Sig) :-
  Sig = [(_, _, Sort)|_],
  bslConformance:termOfSort(Sig, Term, Sort).

% Membership test
bslTerm(File, Term) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BSL/api.pro',prolog(text))
