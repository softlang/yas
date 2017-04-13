# File _languages/FSML/Prolog/to-java/input.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/input.pro)**
```
inputsOfFsm(Fsm, Text) :-

  % Collect input values
  findall(
    I,
    (
      member((_, _, Ts), Fsm),
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/FSML/Prolog/to-java/input.pro',prolog(text))
