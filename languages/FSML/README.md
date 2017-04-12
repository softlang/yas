# Language _FSML (Finite State Machine Language)_
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
* [languages/FSML/sample.fsml](../../languages/FSML/sample.fsml)
* [languages/FSML/sample.term](../../languages/FSML/sample.term)
* [languages/FSML/sample.term](../../languages/FSML/sample.term)
* [languages/FSML/Python/sample.json](../../languages/FSML/Python/sample.json)
* [languages/FSML/tests/determinismNotOk.fsml](../../languages/FSML/tests/determinismNotOk.fsml)
* [languages/FSML/tests/idsNotOk.fsml](../../languages/FSML/tests/idsNotOk.fsml)
* [languages/FSML/tests/initialNotOk1.fsml](../../languages/FSML/tests/initialNotOk1.fsml)
* [languages/FSML/tests/initialNotOk2.fsml](../../languages/FSML/tests/initialNotOk2.fsml)
* [languages/FSML/tests/reachabilityNotOk.fsml](../../languages/FSML/tests/reachabilityNotOk.fsml)
* [languages/FSML/tests/resolutionNotOk.fsml](../../languages/FSML/tests/resolutionNotOk.fsml)
* [languages/FSML/tests/sampleRenamed.fsml](../../languages/FSML/tests/sampleRenamed.fsml)
* [languages/FSML/tests/simple.fsml](../../languages/FSML/tests/simple.fsml)
* [languages/FSML/tests/simple.term](../../languages/FSML/tests/simple.term)
* [languages/FSML/tests/simple.term](../../languages/FSML/tests/simple.term)
* [languages/FSML/tests/initialNotOk1.term](../../languages/FSML/tests/initialNotOk1.term)
* [languages/FSML/tests/initialNotOk2.term](../../languages/FSML/tests/initialNotOk2.term)
* [languages/FSML/tests/idsNotOk.term](../../languages/FSML/tests/idsNotOk.term)
* [languages/FSML/tests/resolutionNotOk.term](../../languages/FSML/tests/resolutionNotOk.term)
* [languages/FSML/tests/determinismNotOk.term](../../languages/FSML/tests/determinismNotOk.term)
* [languages/FSML/tests/reachabilityNotOk.term](../../languages/FSML/tests/reachabilityNotOk.term)
* [languages/FSML/tests/sampleRenamed.term](../../languages/FSML/tests/sampleRenamed.term)
* [languages/FSML/tests/sampleRenamed.term](../../languages/FSML/tests/sampleRenamed.term)
