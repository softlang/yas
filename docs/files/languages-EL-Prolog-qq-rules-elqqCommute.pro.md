# File _languages/EL/Prolog/qq/rules/elqqCommute.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/rules/elqqCommute.pro)**
```
% BEGIN ...
:- module(elqqCommute, []).
% END ...
{|el || $X + $Y |} ~> {|el || $Y + $X |}.
{|el || $X * $Y |} ~> {|el || $Y * $X |}.
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EL/Prolog/qq/rules/elqqCommute.pro',prolog(text))
