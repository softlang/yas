# File _languages/FSML/sample.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/sample.term)**
```
[ 
  (true,locked,[
   (ticket,[collect],unlocked),
   (pass,[alarm],exception)]),

  (false,unlocked,[
    (ticket,[eject],unlocked),
...
```

## Languages
* [FSML](../languages/FSML.md) (fsml(term))
* [FSML](../languages/FSML.md) (ok(fsml(term)))

## References
* elementOf('languages/FSML/sample.term',fsml(term))
* mapsTo(parse,['languages/FSML/sample.fsml'],['languages/FSML/sample.term'])
* elementOf('languages/FSML/sample.term',ok(fsml(term)))
* mapsTo(simulateFsm,['languages/FSML/sample.term','languages/FSML/Prolog/sample.input'],['languages/FSML/Prolog/sample.output'])
* mapsTo(acceptFsm,['languages/FSML/sample.term','languages/FSML/Prolog/sample.input'],[])
* mapsTo(statesOfFsm,['languages/FSML/sample.term'],['languages/FSML/Prolog/generated/State.java'])
* mapsTo(inputsOfFsm,['languages/FSML/sample.term'],['languages/FSML/Prolog/generated/Input.java'])
* mapsTo(actionsOfFsm,['languages/FSML/sample.term'],['languages/FSML/Prolog/generated/Action.java'])
* mapsTo(stepperOfFsm,['languages/FSML/sample.term'],['languages/FSML/Prolog/generated/Stepper.java'])
* mapsTo(fsmToDgl,['languages/FSML/sample.term'],['languages/FSML/Prolog/dot/sample.term'])
* mapsTo(notAcceptFsm,['languages/FSML/sample.term','languages/FSML/tests/illegalSymbol.input'],[])
* mapsTo(notAcceptFsm,['languages/FSML/sample.term','languages/FSML/tests/infeasibleSymbol.input'],[])
* mapsTo(rename,['languages/FSML/tests/renaming.term','languages/FSML/sample.term'],['languages/FSML/tests/sampleRenamed.term'])
