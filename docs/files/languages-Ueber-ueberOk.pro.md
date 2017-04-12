# File _languages/Ueber/ueberOk.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberOk.pro)**
```
% ...
% BEGIN ...
:- module(ueberOk, []).
ok(_, language(L)) :-
  assume(
    languageToBase(L, _),
    'Language ~w: invalid base.', [L] ).
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/ueberOk.pro',prolog(text))
