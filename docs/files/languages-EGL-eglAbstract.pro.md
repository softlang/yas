# File _languages/EGL/eglAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/eglAbstract.pro)**
```
% BEGIN ...
:- module(eglAbstract, []).

% END ...
(qstring, (_, String, _)) ~> Atom :- atom_codes(Atom, String).
(name, String) ~> Atom :- name(Atom, String).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/EGL/eglAbstract.pro',prolog(text))
