# File _languages/Hinzu/hinzuMdFiles.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Hinzu/hinzuMdFiles.pro)**
```
:- module(hinzuMdFiles, []).

main :-
    setof(FN, L^udeclaration(elementOf(FN, L)), FNs),
    maplist(file, FNs).

file(FN1) :-
...
```
