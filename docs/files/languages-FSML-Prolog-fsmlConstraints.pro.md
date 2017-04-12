# File _languages/FSML/Prolog/fsmlConstraints.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/fsmlConstraints.pro)**
```
% BEGIN ...
:- module(fsmlConstraints, []).
% END ...
% Wellness of FSMs
ok(Fsm) :-
  distinctStateIds(Fsm),
  singleInitialState(Fsm),
...
```
