# Language _Term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Term)**

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
* [languages/BSTL/tests/term1.term](../files/languages-BSTL-tests-term1.term.md)
* [languages/BSTL/tests/term2.term](../files/languages-BSTL-tests-term2.term.md)
* [languages/EIPL/Prolog/dynamic.output](../files/languages-EIPL-Prolog-dynamic.output.md)
* [languages/EIPL/Prolog/mixed.output](../files/languages-EIPL-Prolog-mixed.output.md)
* [languages/EIPL/Prolog/static.output](../files/languages-EIPL-Prolog-static.output.md)
* [languages/EL/tests/no-vars.value](../files/languages-EL-tests-no-vars.value.md)
* [languages/FNL/atomToRef.config](../files/languages-FNL-atomToRef.config.md)
* [languages/FSML/Prolog/sample.input](../files/languages-FSML-Prolog-sample.input.md)
* [languages/FSML/Prolog/sample.output](../files/languages-FSML-Prolog-sample.output.md)
* [languages/FSML/tests/illegalSymbol.input](../files/languages-FSML-tests-illegalSymbol.input.md)
* [languages/FSML/tests/infeasibleSymbol.input](../files/languages-FSML-tests-infeasibleSymbol.input.md)
* [languages/FSML/tests/renaming.term](../files/languages-FSML-tests-renaming.term.md)
* [languages/GBL/mm.count](../files/languages-GBL-mm.count.md)
* [languages/MML/mm.count](../files/languages-MML-mm.count.md)
* [languages/TBL/samples/empty.loc](../files/languages-TBL-samples-empty.loc.md)
* [languages/TBL/samples/singleton.loc](../files/languages-TBL-samples-singleton.loc.md)
* [languages/TBL/samples/small-world.loc](../files/languages-TBL-samples-small-world.loc.md)
* [samples/obsolete/expr/editing/new-expr.config](../files/samples-obsolete-expr-editing-new-expr.config.md)
* [samples/obsolete/expr/editing/classes.config](../files/samples-obsolete-expr-editing-classes.config.md)
* [samples/obsolete/expr/editing/classes.term](../files/samples-obsolete-expr-editing-classes.term.md)
