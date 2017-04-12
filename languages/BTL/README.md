# Language _BTL (Basic TAPL Language)_
A trivial expression language with expression forms on Boolean values and natural numbers inspired by a similar language in Pierce's TAPL textbook.

## Purposes
* Illustration

## Links
* variationOf: [EL](http://softlang.github.io/yas/languages/EL.html)

## Representations
* btl(text)
* btl(term)
* ok(btl(term))

## References
* membership(btl(text),bglAcceptor(btlScanner),['languages/BTL/cs.term'])
* membership(btl(term),bslTerm,['languages/BTL/as.term'])
* function(scan,[btl(text)],[btl(tokens(term))],btlScanner,[])
* function(parse,[btl(tokens(term))],[btl(term)],bglParser,['languages/BTL/cs.term'])
* function(parse,[btl(text)],[btl(term)],bglParser(btlScanner),['languages/BTL/cs.term'])
* function(parse,[btl(text)],[btl(term)],bglParser(btlScanner),['languages/BTL/cs.term'])
* function(cstToAst,[btl(bcl(term))],[btl(term)],cstToAst,[])
* function(astToCst,[btl(term)],[btl(bcl(term))],astToCst,['languages/BTL/cs.term'])
* function(unparse,[btl(bcl(term))],[btl(text)],bglTreeToText,[])
* membership(btl(term),btlSyntax:isExpr,[])
* membership(ok(btl(term)),btlTyping:ok,[])
* function(typeOf,[btl(term)],[btl(type(term))],btlTyping:typeOf,[])
* function(bigstep,[ok(btl(term))],[btl(term)],btlBigstep:evaluate,[])
* function(bigstep,[ok(btl(term))],[btl(term)],btlBigstep:evaluate,[])
* function(smallstep,[ok(btl(term))],[btl(term)],btlSmallstep:steps,[])
* function(smallstep,[ok(btl(term))],[btl(term)],btlSmallstep:steps,[])

## Elements
* [languages/BTL/sample.btl](../../languages/BTL/sample.btl)
* [languages/BTL/sample.term](../../languages/BTL/sample.term)
* [languages/BTL/value.term](../../languages/BTL/value.term)
* [languages/BTL/sample.term](../../languages/BTL/sample.term)
