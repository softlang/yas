# File _languages/FSML/tests/resolutionNotOk.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/resolutionNotOk.fsml)**
```
initial state stateA {
  eventI/actionI -> stateB;
  eventII/actionII -> stateC;
}
state stateB { }
```

## Languages
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/tests/resolutionNotOk.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/resolutionNotOk.fsml'],['languages/FSML/tests/resolutionNotOk.term'])
