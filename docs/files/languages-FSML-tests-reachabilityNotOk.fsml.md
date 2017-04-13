# File _languages/FSML/tests/reachabilityNotOk.fsml_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/reachabilityNotOk.fsml)**
```
initial state stateA {
  eventI/actionI -> stateB;
}
state stateB { }
state stateC { }
```

## Languages
* [FSML](../languages/FSML.md) (fsml(text))

## References
* elementOf('languages/FSML/tests/reachabilityNotOk.fsml',fsml(text))
* mapsTo(parse,['languages/FSML/tests/reachabilityNotOk.fsml'],['languages/FSML/tests/reachabilityNotOk.term'])
