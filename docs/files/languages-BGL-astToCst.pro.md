# File _languages/BGL/astToCst.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/astToCst.pro)**
```
% BEGIN ...
:- module(astToCst, []).

% END ...
% Insert leaf for terminal and proceed
(Rules, [t(T)|Symbols], ITrees) ~> [leaf(T)|ETrees] :-
  (Rules, Symbols, ITrees) ~> ETrees.
...
```
