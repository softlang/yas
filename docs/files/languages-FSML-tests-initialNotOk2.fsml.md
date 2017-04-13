# File _languages/FSML/tests/initialNotOk2.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/initialNotOk2.fsml)**
```
initial state stateA {
  eventI/actionI -> stateC;
}
initial state stateB { 
  eventI/actionII -> stateC;
}
state stateC {
}
```

## Languages
* [FSML](../languages/FSML.md) (fsml(text))

## References
* elementOf('languages/FSML/tests/initialNotOk2.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/initialNotOk2.fsml'],['languages/FSML/tests/initialNotOk2.term'])
