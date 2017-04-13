# File _languages/Hinzu/hinzuDump.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/hinzuDump.pro)**
```
:- module(hinzuDump, []).

main(Ds) :-
  findall(
    D,
    hdeclaration(D),
    Ds).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/Hinzu/hinzuDump.pro',prolog(text))
