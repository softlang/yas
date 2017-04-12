# File _languages/FSML/Prolog/to-java/stepper.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/stepper.pro)**
```
stepperOfFsm(Fsm, Text) :-

  % Map transitions to calls to the stepper's "add" method
  findall(S,
    (
      % Iterate over states and transitions
      member((_, From, Ts), Fsm),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/FSML/Prolog/to-java/stepper.pro',prolog(text))
