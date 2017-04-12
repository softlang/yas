# Language _BIPL (Basic Imperative Programming Language)_
A trivial imperative programming language with support for primitive types for integer and Boolean values, but without support for input, output, and procedures.

## Purposes
* Imperative programming

## Links
* embeds(el)
* subsetOf(eipl)
* relatesTo(https://en.wikipedia.org/wiki/C_(programming_language))

## Representations
* bipl(text)
* bipl(term)

## References
* membership(bipl(text),eglAcceptor(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* function(parse,[bipl(text)],[bipl(term)],eglParser(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* function(parse,[bipl(text)],[bipl(term)],eglParser(biplAbstract: (~>)),['languages/BIPL/cs.term','languages/BIPL/ls.term'])
* membership(bipl(term),eslLanguage,['languages/BIPL/as.term'])
* function(bigstep,[bipl(term)],[bipl(store(term))],biplBigstep:execute,[])
* function(smallstep,[bipl(term)],[bipl(store(term))],biplSmallstep:allSteps,[])

## Elements
* [languages/BIPL/samples/abs.bipl](../../languages/BIPL/samples/abs.bipl)
* [languages/BIPL/samples/addmul.bipl](../../languages/BIPL/samples/addmul.bipl)
* [languages/BIPL/samples/bracket.bipl](../../languages/BIPL/samples/bracket.bipl)
* [languages/BIPL/samples/div.bipl](../../languages/BIPL/samples/div.bipl)
* [languages/BIPL/samples/exp-loop.bipl](../../languages/BIPL/samples/exp-loop.bipl)
* [languages/BIPL/samples/exp-sliced.bipl](../../languages/BIPL/samples/exp-sliced.bipl)
* [languages/BIPL/samples/exp-unrolled.bipl](../../languages/BIPL/samples/exp-unrolled.bipl)
* [languages/BIPL/samples/factorialV1.bipl](../../languages/BIPL/samples/factorialV1.bipl)
* [languages/BIPL/samples/factorialV2.bipl](../../languages/BIPL/samples/factorialV2.bipl)
* [languages/BIPL/samples/geq.bipl](../../languages/BIPL/samples/geq.bipl)
* [languages/BIPL/samples/ifthen.bipl](../../languages/BIPL/samples/ifthen.bipl)
* [languages/BIPL/samples/ifthenelse.bipl](../../languages/BIPL/samples/ifthenelse.bipl)
* [languages/BIPL/samples/div.term](../../languages/BIPL/samples/div.term)
* [languages/BIPL/samples/factorialV1.term](../../languages/BIPL/samples/factorialV1.term)
* [languages/BIPL/samples/factorialV2.term](../../languages/BIPL/samples/factorialV2.term)
* [languages/BIPL/samples/abs.term](../../languages/BIPL/samples/abs.term)
* [languages/BIPL/samples/geq.term](../../languages/BIPL/samples/geq.term)
* [languages/BIPL/samples/addmul.term](../../languages/BIPL/samples/addmul.term)
* [languages/BIPL/samples/bracket.term](../../languages/BIPL/samples/bracket.term)
* [languages/BIPL/samples/ifthen.term](../../languages/BIPL/samples/ifthen.term)
* [languages/BIPL/samples/ifthenelse.term](../../languages/BIPL/samples/ifthenelse.term)
* [languages/BIPL/samples/exp-loop.term](../../languages/BIPL/samples/exp-loop.term)
* [languages/BIPL/samples/exp-unrolled.term](../../languages/BIPL/samples/exp-unrolled.term)
* [languages/BIPL/samples/exp-sliced.term](../../languages/BIPL/samples/exp-sliced.term)
