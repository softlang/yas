# File _languages/BSL/bslAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/bslAbstract.pro)**
```
% BEGIN ...
:- module(bslAbstract, []).

% END ...
(name, String) ~> Atom :- name(Atom, String).
(args, [(X, Y)]) ~> [X|Y].
```
