# Language _Term_
Prolog terms as a basic representation format used by the YAS repository.

## Purposes
_None_

## Links

## Representations
* term

## References
* function(acceptBottomUp,[bgl(term),term],[],bglAcceptBottomUp:accept,[])
* function(acceptTopDown,[bgl(term),term],[],bglAcceptTopDown:accept,[])
* function(parseTopDown,[bgl(term),term],[term],bglParseTopDown:parse,[])
* function(parseTopDown,[bgl(term),term],[term],bglParseTopDown:parse,[])
* function(conformsTo,[term,bsl(term)],[],bslConformance,[])
* function(interpret,[bstl(term),term],[term],bstlTerm:interpret,[])
* function(interpret,[bstl(term),term],[term],bstlTerm:interpret,[])
* function(executeDynamic,[eipl(term)],[term],eiplDynamic:main,[])
* function(executeMixed,[eipl(term)],[term],eiplMixed:main,[])
* function(executeStatic,[eipl(term)],[term],eiplStatic:main,[])
* function(evaluate,[el(term)],[term],elEvaluate:evaluate,[])
* membership(term,appliedTerm,[])
* function(conformsTo,[term,esl(term)],[],eslConformance,[])
* function(atomToRef,[term,term,term],[term,term],atomToRef,[])
* function(atomToRef,[term,term,term],[term,term],atomToRef,[])
* function(atomToRef,[term,term,term],[term,term],atomToRef,[])
* function(atomToRef,[term,term,term],[term,term],atomToRef,[])
* function(atomToRef,[term,term,term],[term,term],atomToRef,[])
* function(simulateFsm,[fsml(term),term],[term],simulateFsm,[])
* function(simulateFsm,[fsml(term),term],[term],simulateFsm,[])
* function(acceptFsm,[fsml(term),term],[],acceptFsm,[])
* function(notAcceptFsm,[fsml(term),term],[],notAcceptFsm,[])
* function(rename,[term,fsml(term)],[fsml(term)],fsmlRename:rename,[])
* function(diff,[term,term],[mmdl(term)],mmdlDiff:diff,[])
* function(diff,[term,term],[mmdl(term)],mmdlDiff:diff,[])
* function(count,[mml(term)],[term],mmlCount:count,[])
* function(applyIO,[term,term],[term],applyIO,[])
* function(applyIO,[term,term],[term],applyIO,[])
* function(applyIO,[term,term],[term],applyIO,[])
* function(diff,[term,term],[tdl(term)],tdlDiff:diff,[])
* function(diff,[term,term],[tdl(term)],tdlDiff:diff,[])
* function(applyDiff,[tdl(term),term],[term],tdlApply:apply,[])
* function(applyDiff,[tdl(term),term],[term],tdlApply:apply,[])
* function(loc,[text],[term],textLoc:loc,[])

## Elements
* [languages/BSTL/tests/term1.term](../../languages/BSTL/tests/term1.term)
* [languages/BSTL/tests/term2.term](../../languages/BSTL/tests/term2.term)
* [languages/EIPL/Prolog/dynamic.output](../../languages/EIPL/Prolog/dynamic.output)
* [languages/EIPL/Prolog/mixed.output](../../languages/EIPL/Prolog/mixed.output)
* [languages/EIPL/Prolog/static.output](../../languages/EIPL/Prolog/static.output)
* [languages/EL/tests/no-vars.value](../../languages/EL/tests/no-vars.value)
* [languages/FNL/atomToRef.config](../../languages/FNL/atomToRef.config)
* [languages/FSML/Prolog/sample.input](../../languages/FSML/Prolog/sample.input)
* [languages/FSML/Prolog/sample.output](../../languages/FSML/Prolog/sample.output)
* [languages/FSML/tests/illegalSymbol.input](../../languages/FSML/tests/illegalSymbol.input)
* [languages/FSML/tests/infeasibleSymbol.input](../../languages/FSML/tests/infeasibleSymbol.input)
* [languages/FSML/tests/renaming.term](../../languages/FSML/tests/renaming.term)
* [languages/GBL/mm.count](../../languages/GBL/mm.count)
* [languages/MML/mm.count](../../languages/MML/mm.count)
* [languages/TBL/samples/empty.loc](../../languages/TBL/samples/empty.loc)
* [languages/TBL/samples/singleton.loc](../../languages/TBL/samples/singleton.loc)
* [languages/TBL/samples/small-world.loc](../../languages/TBL/samples/small-world.loc)
* [samples/obsolete/expr/editing/new-expr.config](../../samples/obsolete/expr/editing/new-expr.config)
* [samples/obsolete/expr/editing/classes.config](../../samples/obsolete/expr/editing/classes.config)
* [samples/obsolete/expr/editing/classes.term](../../samples/obsolete/expr/editing/classes.term)
