# File _languages/FSML/Prolog/accept.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/accept.pro)**
```
% Simulation while ignoring output
acceptFsm(Fsm, Input) :-
  simulateFsm(Fsm, Input, _).

% Negation of acceptance
notAcceptFsm(Fsm, Input) :-
  not(acceptFsm(Fsm, Input)).

```
