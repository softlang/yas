# Language _BNL (Basic Number Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL)**

A trivial language for the representation of binary numbers.

## Purposes
* Illustration

## Links

## Representations
* bnl(text)
* bnl(term)

## References
* membership(bnl(text),bglAcceptor(bnlScanner),['languages/BNL/cs.term'])
* membership(bnl(term),bslTerm,['languages/BNL/as.term'])
* function(scan,[bnl(text)],[bnl(tokens(term))],bnlScanner,[])
* function(parse,[bnl(tokens(term))],[bnl(term)],bglParser,['languages/BNL/cs.term'])
* function(parse,[bnl(text)],[bnl(term)],bglParser(bnlScanner),['languages/BNL/cs.term'])
* function(parse,[bnl(text)],[bnl(term)],bglParser(bnlScanner),['languages/BNL/cs.term'])
* function(cstToAst,[bnl(bcl(term))],[bnl(term)],cstToAst,[])
* function(astToCst,[bnl(term)],[bnl(bcl(term))],astToCst,['languages/BNL/cs.term'])
* function(unparse,[bnl(bcl(term))],[bnl(text)],bglTreeToText,[])
* membership(bnl(text),java('org.softlang.BnlEbnfAcceptor'),['languages/BNL/ANTLR/.'])
* function(parse,[bnl(tokens(term))],[bnl(term)],dcgParser(bnlParser:number),[])
* function(evaluate,[bnl(term)],[bnl(value(term))],bnlTermToValue:number,[])
* function(evaluate,[bnl(term)],[bnl(value(term))],bnlTermToValueS:number,[])
* function(convert,[bnl(term)],[bnl(formula(term))],bnlTermToFormula:number,[])

## Elements
* [languages/BNL/samples/10.bnl](../files/languages-BNL-samples-10.bnl.md)
* [languages/BNL/samples/5comma25.bnl](../files/languages-BNL-samples-5comma25.bnl.md)
* [languages/BNL/samples/10.term](../files/languages-BNL-samples-10.term.md)
* [languages/BNL/samples/5comma25.term](../files/languages-BNL-samples-5comma25.term.md)
