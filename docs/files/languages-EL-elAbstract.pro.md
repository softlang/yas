# File _languages/EL/elAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/elAbstract.pro)**
```
% BEGIN ...
:- module(elAbstract, []).
% END ...
% Eliminate bracketing
(_, brackets(E)) ~> E.

% Make unary expressions abstract
...
```
