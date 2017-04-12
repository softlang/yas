# File _languages/FSML/tests/initialNotOk1.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/initialNotOk1.fsml)**
```
state stateA {
  eventI/actionI -> stateB;
}
state stateB {
  eventII/actionII -> stateA;
}
```

## Languages
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/tests/initialNotOk1.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/initialNotOk1.fsml'],['languages/FSML/tests/initialNotOk1.term'])
