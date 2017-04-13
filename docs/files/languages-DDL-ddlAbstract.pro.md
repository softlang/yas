# File _languages/DDL/ddlAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL/ddlAbstract.pro)**
```
% BEGIN ...
:- module(ddlAbstract, []).

% END ...
% Poormen's separator lists
(table, (Name, [(Column, Columns)])) ~> (Name, [Column|Columns]).
% Lexical mapping for integers
(integer, Digits) ~> Int :- number_codes(Int, Digits).
% Lexical mapping for names
(name, (Char, String)) ~> Atom :- name(Atom, [Char|String]).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/DDL/ddlAbstract.pro',prolog(text))
