# File _languages/Ueber/ueberDispatch.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberDispatch.pro)**
```
% BEGIN ...
:- module(ueberDispatch, []).
% END ...
overloads(Ds, R, InFs, OutFs, Overloads2) :-
  findall( (Pred, Args, InLs, OutLs), (
      member(function(R, InLs, OutLs, Pred, Args), Ds),
      map(ueberDispatch:inferredLanguage(Ds), InFs, InLs),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/ueberDispatch.pro',prolog(text))
