# File _languages/BFPL/Prolog/typing/expr.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/typing/expr.pro)**
```
% BEGIN ...
:- module(bfplExpr, []).
% END ...
% An int constant is of the int type
ok(_, _, intconst(_), inttype).

% The context provides the type of an argument name 
...
```