# File _languages/TBL/tblOk.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/tblOk.pro)**
```
% BEGIN ...
:- module(tblOk, []).
% END ...
world(Ps) :- map(tblOk:person(Ps), Ps).
person(_, (_, [])).
person(Ps, (X1, [X2])) :- \+ X1 == X2, member((X2, _), Ps).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/TBL/tblOk.pro',prolog(text))
