# File _languages/FSML/Prolog/to-java/action.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/action.pro)**
```
actionsOfFsm(Fsm, Text) :-

  % Find all action names
  findall(
    A,
    (
      member((_, _, Ts), Fsm),
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/FSML/Prolog/to-java/action.pro',prolog(text))
