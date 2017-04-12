# File _languages/Ueber/ueberIO.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberIO.pro)**
```
% BEGIN ...
:- module(ueberIO, []).
% END ...
readFile(F, L, Content) :-
  languageToBase(L, B),
  assume(
    exists_file(F),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/ueberIO.pro',prolog(text))
