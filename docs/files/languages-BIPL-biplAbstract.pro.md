# File _languages/BIPL/biplAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/biplAbstract.pro)**
```
% BEGIN ...
:- module(biplAbstract, []).

% END ...
% Map blocks to sequential composition
(stmt, block(Ss)) ~> S :- block(Ss) ~> S.
block([]) ~> skip.
...
```
