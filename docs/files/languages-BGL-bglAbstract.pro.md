# File _languages/BGL/bglAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/bglAbstract.pro)**
```
% BEGIN ...
:- module(bglAbstract, []).

% END ...
(qstring, (_, String, _)) ~> Atom :- atom_codes(Atom, String).
(name, String) ~> Atom :- name(Atom, String).
```
