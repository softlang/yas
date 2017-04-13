# File _languages/FSML/tests/idsNotOk.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/idsNotOk.fsml)**
```
initial state stateA {
  eventI/actionI -> stateZ;
}
state stateA {
  eventII/actionII -> stateZ;
}
state stateZ { }
```

## Languages
* [FSML](../languages/FSML.md) (fsml(text))

## References
* elementOf('languages/FSML/tests/idsNotOk.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/idsNotOk.fsml'],['languages/FSML/tests/idsNotOk.term'])
