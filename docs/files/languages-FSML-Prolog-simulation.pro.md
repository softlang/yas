# File _languages/FSML/Prolog/simulation.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/simulation.pro)**
```
% Simulate FSM for given input to compute output
simulateFsm(
  Fsm,
  Input,
  Output
) :-
     member((true, Id, _), Fsm), % Select initial state
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/FSML/Prolog/simulation.pro',prolog(text))
