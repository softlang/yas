# File _languages/Hinzu/hinzuLanguageToMd.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/hinzuLanguageToMd.pro)**
```
:- module(hinzuLanguageToMd, []).

main(Hinzu, Md1, Md2) :-
  member(l(Is), Hinzu),
  member(lid(L), Is),
  (
    member(name(N), Is)
...
```
