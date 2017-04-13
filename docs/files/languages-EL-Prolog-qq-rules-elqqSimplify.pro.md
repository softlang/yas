# File _languages/EL/Prolog/qq/rules/elqqSimplify.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/rules/elqqSimplify.pro)**
```
% BEGIN ...
:- module(elqqSimplify, []).
% END ...
{|el || $X + 0 |} ~> {|el || $X |}.
{|el || $X * 1 |} ~> {|el || $X |}.
{|el || $_ * 0 |} ~> {|el || 0 |}.
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EL/Prolog/qq/rules/elqqSimplify.pro',prolog(text))
