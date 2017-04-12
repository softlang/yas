# File _languages/ESL/eslAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/eslAbstract.pro)**
```
% BEGIN ...
:- module(eslAbstract, []).

% END ...
(typeexpr, (T1, C)) ~> T2 :-
  eslCardinality(T1, C, T2).

...
```
