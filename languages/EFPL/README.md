# Language _EFPL (Extended Functional Programming Language)_
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
* [languages/EFPL/tests/sample.term](../../languages/EFPL/tests/sample.term)
* [languages/EFPL/tests/sample-past-inference.term](../../languages/EFPL/tests/sample-past-inference.term)
* [languages/EFPL/tests/sample-past-specialization.term](../../languages/EFPL/tests/sample-past-specialization.term)
* [languages/EFPL/tests/sample-past-inference.efpl](../../languages/EFPL/tests/sample-past-inference.efpl)
* [languages/EFPL/tests/sample-past-specialization.efpl](../../languages/EFPL/tests/sample-past-specialization.efpl)
* [languages/EFPL/tests/sample.efpl](../../languages/EFPL/tests/sample.efpl)
* [languages/EFPL/tests/sample.term](../../languages/EFPL/tests/sample.term)
* [languages/EFPL/tests/sample-past-inference.term](../../languages/EFPL/tests/sample-past-inference.term)
* [languages/EFPL/tests/sample-past-specialization.term](../../languages/EFPL/tests/sample-past-specialization.term)
