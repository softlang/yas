# File _languages/BTL/scanner.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/scanner.pro)**
```
btlScanner([], []).

btlScanner([C|String], L) :-
    member(C, [10, 32]),
    btlScanner(String, L).

btlScanner(String1, [Token|L]) :-
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BTL/scanner.pro',prolog(text))
