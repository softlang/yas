# File _languages/TBL/tblAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/tblAbstract.pro)**
```
% BEGIN ...
:- module(tblAbstract, []).

% END ...
% Map strings to better primitive types
(integer, Digits) ~> Int :- number_codes(Int, Digits).
(name, String) ~> Atom :- name(Atom, String).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/TBL/tblAbstract.pro',prolog(text))
