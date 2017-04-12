# File _languages/FSML/tests/determinismNotOk.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/tests/determinismNotOk.term)**
```
[ (true,stateA,[ (eventI,[actionI],stateB), (eventI,[actionII],stateC)]), (false,stateB,[]), (false,stateC,[])].
```

## Languages
* [FSML](../languages/FSML.md)

## References
* elementOf('languages/FSML/tests/determinismNotOk.term',fsml(term))
* mapsTo(parse,['languages/FSML/tests/determinismNotOk.fsml'],['languages/FSML/tests/determinismNotOk.term'])
