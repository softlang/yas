# Language _BFPL (Basic Functional Programming Language)_
A trivial first-order functional programming language with support for primitive types for integer and Boolean values, but without support for algebraic datatypes.

## Purposes
* Functional programming

## Links
* embeds: [EL](http://softlang.github.io/yas/languages/EL.html)
* subsetOf: [EFPL](http://softlang.github.io/yas/languages/EFPL.html)
* relatesTo: [https://en.wikipedia.org/wiki/Haskell_(programming_language)](https://en.wikipedia.org/wiki/Haskell_(programming_language))

## Representations
* bfpl(text)
* bfpl(term)
* ok(bfpl(term))

## References
* membership(bfpl(text),eglAcceptor(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* function(parse,[bfpl(text)],[bfpl(term)],eglParser(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* function(parse,[bfpl(text)],[bfpl(term)],eglParser(bfplAbstract: (~>)),['languages/BFPL/cs.term','languages/BFPL/ls.term'])
* membership(bfpl(term),eslLanguage,['languages/BFPL/as.term'])
* membership(ok(bfpl(term)),bfplProg:ok,[])
* function(bigstep,[ok(bfpl(term))],[bfpl(value(term))],bfplBigstep:evaluate,[])
* function(smallstep,[ok(bfpl(term))],[bfpl(normal(term))],bfplSmallstep:allSteps,[])
* function(denotational,[ok(bfpl(term))],[bfpl(value(term))],bfplDenotational:prog,[])

## Elements
* [languages/BFPL/samples/factorial.term](../../languages/BFPL/samples/factorial.term)
* [languages/BFPL/samples/power.term](../../languages/BFPL/samples/power.term)
* [languages/BFPL/samples/abs.bfpl](../../languages/BFPL/samples/abs.bfpl)
* [languages/BFPL/samples/factorial.bfpl](../../languages/BFPL/samples/factorial.bfpl)
* [languages/BFPL/samples/power.bfpl](../../languages/BFPL/samples/power.bfpl)
* [languages/BFPL/samples/factorial.term](../../languages/BFPL/samples/factorial.term)
* [languages/BFPL/samples/power.term](../../languages/BFPL/samples/power.term)
* [languages/BFPL/samples/abs.term](../../languages/BFPL/samples/abs.term)
