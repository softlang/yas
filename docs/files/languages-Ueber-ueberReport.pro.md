# File _languages/Ueber/ueberReport.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberReport.pro)**
```
:- module(ueberReport, []).

report(Ds) :-
  % Languages
  findall(L, member(language(L), Ds), Ls),
  length(Ls, NumLs),  
  format('~w languages.~n', [NumLs]),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/ueberReport.pro',prolog(text))
