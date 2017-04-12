# File _languages/MML/mmlAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/mmlAbstract.pro)**
```
% BEGIN ...
:- module(mmlAbstract, []).

% END ...
(name, String) ~> Atom :- name(Atom, String).
(abstract, abstract) ~> true.
(abstract, concrete) ~> false.
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/MML/mmlAbstract.pro',prolog(text))
