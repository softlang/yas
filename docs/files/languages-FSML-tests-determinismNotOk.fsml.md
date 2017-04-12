# File _languages/FSML/tests/determinismNotOk.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/determinismNotOk.fsml)**
```
initial state stateA {
  eventI/actionI -> stateB;
  eventI/actionII -> stateC;
}
state stateB { }
state stateC { }
```

## Languages
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/tests/determinismNotOk.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/determinismNotOk.fsml'],['languages/FSML/tests/determinismNotOk.term'])
