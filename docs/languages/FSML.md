# Language _FSML (Finite State Machine Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML)**

A simple domain-specific modeling language (DSML) for finite state machines (FSMs).

## Purposes
_None_

## Links

## Representations
* fsml(text)
* fsml(term)
* ok(fsml(term))
* ok(fsml(json))

## References
* membership(fsml(text),eglAcceptor(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* function(parse,[fsml(text)],[fsml(term)],eglParser(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* function(parse,[fsml(text)],[fsml(term)],eglParser(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* membership(fsml(term),eslLanguage,['languages/FSML/as.term'])
* membership(fsml(text),haskell('FsmlAcceptor'),['languages/FSML/Haskell/.'])
* membership(fsml(text),java('org.softlang.FsmlAcceptor'),['languages/FSML/Java/.'])
* membership(ok(fsml(term)),fsmlConstraints:ok,[])
* function(simulateFsm,[fsml(term),term],[term],simulateFsm,[])
* function(acceptFsm,[fsml(term),term],[],acceptFsm,[])
* function(notAcceptFsm,[fsml(term),term],[],notAcceptFsm,[])
* function(statesOfFsm,[fsml(term)],[java(text)],statesOfFsm,[])
* function(inputsOfFsm,[fsml(term)],[java(text)],inputsOfFsm,[])
* function(actionsOfFsm,[fsml(term)],[java(text)],actionsOfFsm,[])
* function(stepperOfFsm,[fsml(term)],[java(text)],stepperOfFsm,[])
* function(fsmToDgl,[fsml(term)],[dgl(term)],fsmToDgl,[])
* membership(fsml(text),python('FsmlAcceptor'),['languages/FSML/Python/.'])
* membership(ok(fsml(json)),python('FsmlChecker'),['languages/FSML/Python/.'])
* function(parse,[fsml(text)],[json],python('FsmlToJSON'),['languages/FSML/Python/.'])
* function(visualize,[ok(fsml(json))],[dot(text)],python('FsmlToDot'),['languages/FSML/Python/.'])
* function(rename,[term,fsml(term)],[fsml(term)],fsmlRename:rename,[])
* function(rename,[term,fsml(term)],[fsml(term)],fsmlRename:rename,[])

## Elements
* [languages/FSML/sample.fsml](../files/languages-FSML-sample.fsml.md)
* [languages/FSML/sample.term](../files/languages-FSML-sample.term.md)
* [languages/FSML/sample.term](../files/languages-FSML-sample.term.md)
* [languages/FSML/Python/sample.json](../files/languages-FSML-Python-sample.json.md)
* [languages/FSML/tests/determinismNotOk.fsml](../files/languages-FSML-tests-determinismNotOk.fsml.md)
* [languages/FSML/tests/idsNotOk.fsml](../files/languages-FSML-tests-idsNotOk.fsml.md)
* [languages/FSML/tests/initialNotOk1.fsml](../files/languages-FSML-tests-initialNotOk1.fsml.md)
* [languages/FSML/tests/initialNotOk2.fsml](../files/languages-FSML-tests-initialNotOk2.fsml.md)
* [languages/FSML/tests/reachabilityNotOk.fsml](../files/languages-FSML-tests-reachabilityNotOk.fsml.md)
* [languages/FSML/tests/resolutionNotOk.fsml](../files/languages-FSML-tests-resolutionNotOk.fsml.md)
* [languages/FSML/tests/sampleRenamed.fsml](../files/languages-FSML-tests-sampleRenamed.fsml.md)
* [languages/FSML/tests/simple.fsml](../files/languages-FSML-tests-simple.fsml.md)
* [languages/FSML/tests/simple.term](../files/languages-FSML-tests-simple.term.md)
* [languages/FSML/tests/simple.term](../files/languages-FSML-tests-simple.term.md)
* [languages/FSML/tests/initialNotOk1.term](../files/languages-FSML-tests-initialNotOk1.term.md)
* [languages/FSML/tests/initialNotOk2.term](../files/languages-FSML-tests-initialNotOk2.term.md)
* [languages/FSML/tests/idsNotOk.term](../files/languages-FSML-tests-idsNotOk.term.md)
* [languages/FSML/tests/resolutionNotOk.term](../files/languages-FSML-tests-resolutionNotOk.term.md)
* [languages/FSML/tests/determinismNotOk.term](../files/languages-FSML-tests-determinismNotOk.term.md)
* [languages/FSML/tests/reachabilityNotOk.term](../files/languages-FSML-tests-reachabilityNotOk.term.md)
* [languages/FSML/tests/sampleRenamed.term](../files/languages-FSML-tests-sampleRenamed.term.md)
* [languages/FSML/tests/sampleRenamed.term](../files/languages-FSML-tests-sampleRenamed.term.md)
