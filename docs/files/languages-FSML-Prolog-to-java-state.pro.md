# File _languages/FSML/Prolog/to-java/state.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-java/state.pro)**
```
statesOfFsm(Fsm, Text) :-

  % Collect declared states
  findall(
    Id,
    member((_, Id, _), Fsm),
    Ids),

  % Render enum type
  ppJavaDecl(enum(public, 'State', Ids), Text).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/FSML/Prolog/to-java/state.pro',prolog(text))
