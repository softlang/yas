# File _languages/GBL/gblAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/gblAbstract.pro)**
```
% BEGIN ...
:- module(gblAbstract, []).

% END ...
world:Persons1 => { class : world, persons : Persons2 } :-
  map(gblAbstract:(=>), Persons1, Persons2).

```