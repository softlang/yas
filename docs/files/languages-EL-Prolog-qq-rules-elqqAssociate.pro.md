# File _languages/EL/Prolog/qq/rules/elqqAssociate.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/rules/elqqAssociate.pro)**
```
% BEGIN ...
:- module(elqqAssociate, []).
% END ...
{|el || ($X + $Y) + $Z |} ~> {|el || $X + ($Y + $Z) |}.
{|el || ($X * $Y) * $Z |} ~> {|el || $X * ($Y * $Z) |}.
```
