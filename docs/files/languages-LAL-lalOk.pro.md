# File _languages/LAL/lalOk.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalOk.pro)**
```
% BEGIN ...
:- module(lalOk, []).
% END ...
model(Ds) :-
    typesOfNames(Ds),
    map(lalOk:decl(Ds), Ds).

...
```
