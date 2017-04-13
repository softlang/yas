# File _languages/EGTL/egtlAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/egtlAbstract.pro)**
```
% BEGIN ...
:- module(egtlAbstract, []).

% END ...
(qstring, (_, String, _)) ~> Atom :- atom_codes(Atom, String).
(name, String) ~> Atom :- name(Atom, String).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/EGTL/egtlAbstract.pro',prolog(text))
