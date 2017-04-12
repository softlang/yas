# File _languages/TBL/tblOne.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/tblOne.pro)**
```
% BEGIN ...
:- module(tblOne, []).
% END ...
world(Ps) :- map(tblOne:person, Ps).
person((_, [_])).
```
