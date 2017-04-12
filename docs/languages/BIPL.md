# Language _BIPL (Basic Imperative Programming Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL)**

A trivial imperative programming language with support for primitive types for integer and Boolean values, but without support for input, output, and procedures.

## Purposes
* Imperative programming

## Links
* embeds: [EL](http://softlang.github.io/yas/languages/EL.html)
* subsetOf: [EIPL](http://softlang.github.io/yas/languages/EIPL.html)
* relatesTo: [https://en.wikipedia.org/wiki/C_(programming_language)](https://en.wikipedia.org/wiki/C_(programming_language))

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
* [languages/BIPL/samples/abs.bipl](../files/languages-BIPL-samples-abs.bipl.md)
* [languages/BIPL/samples/addmul.bipl](../files/languages-BIPL-samples-addmul.bipl.md)
* [languages/BIPL/samples/bracket.bipl](../files/languages-BIPL-samples-bracket.bipl.md)
* [languages/BIPL/samples/div.bipl](../files/languages-BIPL-samples-div.bipl.md)
* [languages/BIPL/samples/exp-loop.bipl](../files/languages-BIPL-samples-exp-loop.bipl.md)
* [languages/BIPL/samples/exp-sliced.bipl](../files/languages-BIPL-samples-exp-sliced.bipl.md)
* [languages/BIPL/samples/exp-unrolled.bipl](../files/languages-BIPL-samples-exp-unrolled.bipl.md)
* [languages/BIPL/samples/factorialV1.bipl](../files/languages-BIPL-samples-factorialV1.bipl.md)
* [languages/BIPL/samples/factorialV2.bipl](../files/languages-BIPL-samples-factorialV2.bipl.md)
* [languages/BIPL/samples/geq.bipl](../files/languages-BIPL-samples-geq.bipl.md)
* [languages/BIPL/samples/ifthen.bipl](../files/languages-BIPL-samples-ifthen.bipl.md)
* [languages/BIPL/samples/ifthenelse.bipl](../files/languages-BIPL-samples-ifthenelse.bipl.md)
* [languages/BIPL/samples/div.term](../files/languages-BIPL-samples-div.term.md)
* [languages/BIPL/samples/factorialV1.term](../files/languages-BIPL-samples-factorialV1.term.md)
* [languages/BIPL/samples/factorialV2.term](../files/languages-BIPL-samples-factorialV2.term.md)
* [languages/BIPL/samples/abs.term](../files/languages-BIPL-samples-abs.term.md)
* [languages/BIPL/samples/geq.term](../files/languages-BIPL-samples-geq.term.md)
* [languages/BIPL/samples/addmul.term](../files/languages-BIPL-samples-addmul.term.md)
* [languages/BIPL/samples/bracket.term](../files/languages-BIPL-samples-bracket.term.md)
* [languages/BIPL/samples/ifthen.term](../files/languages-BIPL-samples-ifthen.term.md)
* [languages/BIPL/samples/ifthenelse.term](../files/languages-BIPL-samples-ifthenelse.term.md)
* [languages/BIPL/samples/exp-loop.term](../files/languages-BIPL-samples-exp-loop.term.md)
* [languages/BIPL/samples/exp-unrolled.term](../files/languages-BIPL-samples-exp-unrolled.term.md)
* [languages/BIPL/samples/exp-sliced.term](../files/languages-BIPL-samples-exp-sliced.term.md)
