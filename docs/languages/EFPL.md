# Language _EFPL (Extended Functional Programming Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL)**

A small extension of the trivial functional programming language BFPL to provide higher-order functions, polymorphism, and type inference.

## Purposes
* Functional programming

## Links
* supersetOf: [BFPL](http://softlang.github.io/yas/languages/BFPL.html)

## Representations
* efpl(text)
* efpl(term)
* ok(efpl(term))

## References
* membership(efpl(text),eglAcceptor(efplAbstract: (~>)),['languages/EFPL/cs.term','languages/EFPL/ls.term'])
* function(parse,[efpl(text)],[efpl(term)],eglParser(efplAbstract: (~>)),['languages/EFPL/cs.term','languages/EFPL/ls.term'])
* function(parse,[efpl(text)],[efpl(term)],eglParser(efplAbstract: (~>)),['languages/EFPL/cs.term','languages/EFPL/ls.term'])
* membership(efpl(term),eslLanguage,['languages/EFPL/as.term'])
* membership(ok(efpl(term)),efplTyping:okProg,[])
* function(infer,[ok(efpl(term))],[ok(efpl(term))],efplTyping:okProg,[])
* function(infer,[ok(efpl(term))],[ok(efpl(term))],efplTyping:okProg,[])
* function(bigstep,[ok(efpl(term))],[efpl(value(term))],efplBigstep:evaluate,[])

## Elements
* [languages/EFPL/tests/sample.term](../files/languages-EFPL-tests-sample.term.md)
* [languages/EFPL/tests/sample-past-inference.term](../files/languages-EFPL-tests-sample-past-inference.term.md)
* [languages/EFPL/tests/sample-past-specialization.term](../files/languages-EFPL-tests-sample-past-specialization.term.md)
* [languages/EFPL/tests/sample-past-inference.efpl](../files/languages-EFPL-tests-sample-past-inference.efpl.md)
* [languages/EFPL/tests/sample-past-specialization.efpl](../files/languages-EFPL-tests-sample-past-specialization.efpl.md)
* [languages/EFPL/tests/sample.efpl](../files/languages-EFPL-tests-sample.efpl.md)
* [languages/EFPL/tests/sample.term](../files/languages-EFPL-tests-sample.term.md)
* [languages/EFPL/tests/sample-past-inference.term](../files/languages-EFPL-tests-sample-past-inference.term.md)
* [languages/EFPL/tests/sample-past-specialization.term](../files/languages-EFPL-tests-sample-past-specialization.term.md)
