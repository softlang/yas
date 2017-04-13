# File _languages/LAL/lalAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalAbstract.pro)**
```
:- module(lalAbstract, []).

% Lexical mapping
(name, (Char, Chars)) ~> Atom :- name(Atom, [Char|Chars]).
(url, (_, Chars, _)) ~> Atom :- name(Atom, Chars).

% Separator lists for module names
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/LAL/lalAbstract.pro',prolog(text))
