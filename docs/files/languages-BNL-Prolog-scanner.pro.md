# File _languages/BNL/Prolog/scanner.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/scanner.pro)**
```
% Turn string into list of singleton character atoms
bnlScanner(String1, L2) :-
  ( append(String2, [10], String1) -> true; String2 = String1 ),
  map(singleton, String2, L1),
  map(flip(atom_codes), L1, L2).

```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BNL/Prolog/scanner.pro',prolog(text))
