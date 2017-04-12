# Language _EL (Expression Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL)**

A trivial expression language with expression forms on integer and Boolean values with arithmetic, relational, and comparison operators.

## Purposes
_None_

## Links
* variationOf: [BTL](http://softlang.github.io/yas/languages/BTL.html)

## Representations
* el(text)
* el(term)

## References
* membership(el(text),eglAcceptor(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* function(parse,[el(text)],[el(term)],eglParser(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* function(parse,[el(text)],[el(term)],eglParser(elAbstract: (~>)),['languages/EL/cs.term','languages/EL/ls.term'])
* membership(el(term),eslLanguage,['languages/EL/as.term'])
* function(evaluate,[el(term)],[term],elEvaluate:evaluate,[])
* function(simplify,[el(term)],[el(term)],elSimplify: (~>),[])
* function(simplify,[el(term)],[el(term)],elSimplify: (~>),[])
* function(simplify,[el(term)],[el(term)],elqqSimplify: (~>),[])
* function(simplify,[el(term)],[el(term)],elqqSimplify: (~>),[])
* function(try,[el(term)],[el(term)],elRewrite:try,[])
* function(try,[el(term)],[el(term)],elRewrite:try,[])
* function(vtry,[el(term)],[el(term)],elRewrite:vtry,[])
* function(vtry,[el(term)],[el(term)],elRewrite:vtry,[])
* function(fulltd,[el(term)],[el(term)],elRewrite:fulltd,[])
* function(fulltd,[el(term)],[el(term)],elRewrite:fulltd,[])
* function(fullbu,[el(term)],[el(term)],elRewrite:fullbu,[])
* function(fullbu,[el(term)],[el(term)],elRewrite:fullbu,[])
* function(innermost,[el(term)],[el(term)],elRewrite:innermost,[])
* function(innermost,[el(term)],[el(term)],elRewrite:innermost,[])

## Elements
* [languages/EL/tests/a-plus-b.el](../files/languages-EL-tests-a-plus-b.el.md)
* [languages/EL/tests/a.el](../files/languages-EL-tests-a.el.md)
* [languages/EL/tests/deep-unit.el](../files/languages-EL-tests-deep-unit.el.md)
* [languages/EL/tests/left-associated.el](../files/languages-EL-tests-left-associated.el.md)
* [languages/EL/tests/mix-associated.el](../files/languages-EL-tests-mix-associated.el.md)
* [languages/EL/tests/needs-commute.el](../files/languages-EL-tests-needs-commute.el.md)
* [languages/EL/tests/needs-fullbu.el](../files/languages-EL-tests-needs-fullbu.el.md)
* [languages/EL/tests/no-vars.el](../files/languages-EL-tests-no-vars.el.md)
* [languages/EL/tests/right-associated.el](../files/languages-EL-tests-right-associated.el.md)
* [languages/EL/tests/top-unit.el](../files/languages-EL-tests-top-unit.el.md)
* [languages/EL/tests/no-vars.term](../files/languages-EL-tests-no-vars.term.md)
* [languages/EL/tests/a.term](../files/languages-EL-tests-a.term.md)
* [languages/EL/tests/top-unit.term](../files/languages-EL-tests-top-unit.term.md)
* [languages/EL/tests/needs-commute.term](../files/languages-EL-tests-needs-commute.term.md)
* [languages/EL/tests/needs-fullbu.term](../files/languages-EL-tests-needs-fullbu.term.md)
* [languages/EL/tests/left-associated.term](../files/languages-EL-tests-left-associated.term.md)
* [languages/EL/tests/mix-associated.term](../files/languages-EL-tests-mix-associated.term.md)
* [languages/EL/tests/right-associated.term](../files/languages-EL-tests-right-associated.term.md)
