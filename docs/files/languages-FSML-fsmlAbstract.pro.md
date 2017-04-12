# File _languages/FSML/fsmlAbstract.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/fsmlAbstract.pro)**
```
% BEGIN ...
:- module(fsmlAbstract, []).

% END ...
% Mapping for states
(state, (I1, N, Ts1)) ~> (I2, N, Ts2) :-
  ( I1 == [] -> I2 = false; I2 = true ), % initial or not
...
```
