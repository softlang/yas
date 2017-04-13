# File _languages/EL/Prolog/qq/elqqAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/elqqAbstract.pro)**
```
% BEGIN ...
:- module(elqqAbstract, []).
% END ...
X ~> Y :- elAbstract:'~>'(X, Y).
(metavar, (Char, String)) ~> Atom :- name(Atom, [Char|String]).
(metavar, String) ~> Atom :- is_list(String), name(Atom, [0'_|String]).

```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EL/Prolog/qq/elqqAbstract.pro',prolog(text))
