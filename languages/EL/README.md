# Language _EL (Expression Language)_
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
* [languages/EL/tests/a-plus-b.el](../../languages/EL/tests/a-plus-b.el)
* [languages/EL/tests/a.el](../../languages/EL/tests/a.el)
* [languages/EL/tests/deep-unit.el](../../languages/EL/tests/deep-unit.el)
* [languages/EL/tests/left-associated.el](../../languages/EL/tests/left-associated.el)
* [languages/EL/tests/mix-associated.el](../../languages/EL/tests/mix-associated.el)
* [languages/EL/tests/needs-commute.el](../../languages/EL/tests/needs-commute.el)
* [languages/EL/tests/needs-fullbu.el](../../languages/EL/tests/needs-fullbu.el)
* [languages/EL/tests/no-vars.el](../../languages/EL/tests/no-vars.el)
* [languages/EL/tests/right-associated.el](../../languages/EL/tests/right-associated.el)
* [languages/EL/tests/top-unit.el](../../languages/EL/tests/top-unit.el)
* [languages/EL/tests/no-vars.term](../../languages/EL/tests/no-vars.term)
* [languages/EL/tests/a.term](../../languages/EL/tests/a.term)
* [languages/EL/tests/top-unit.term](../../languages/EL/tests/top-unit.term)
* [languages/EL/tests/needs-commute.term](../../languages/EL/tests/needs-commute.term)
* [languages/EL/tests/needs-fullbu.term](../../languages/EL/tests/needs-fullbu.term)
* [languages/EL/tests/left-associated.term](../../languages/EL/tests/left-associated.term)
* [languages/EL/tests/mix-associated.term](../../languages/EL/tests/mix-associated.term)
* [languages/EL/tests/right-associated.term](../../languages/EL/tests/right-associated.term)
