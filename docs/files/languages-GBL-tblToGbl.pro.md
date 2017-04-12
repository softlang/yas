# File _languages/GBL/tblToGbl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/tblToGbl.pro)**
```
% BEGIN ...
:- module(tblToGbl, []).

% END ...
% Map TBL to GBL worlds
World1 => World2 :- 
  lookup(persons, World1, Ps1),
...
```
