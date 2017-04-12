# Language _BSL (Basic Signature Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL)**

A basic specification language for tree-based abstract syntax on the grounds of many-sorted signatures.

## Purposes
* Tree-based abstract syntax definition
* Abstract syntax definition
* Language definition

## Links
* subsetOf: [ESL](http://softlang.github.io/yas/languages/ESL.html)

## Representations
* bsl(text)
* bsl(term)

## References
* function(project,[bgl(term)],[bsl(term)],bglToBsl: (~>),[])
* membership(bsl(text),elementOfBsl,[])
* membership(bsl(term),signature,[])
* function(parse,[bsl(text)],[bsl(term)],parserOfBsl,[])
* function(parse,[bsl(text)],[bsl(term)],parserOfBsl,[])
* membership(bsl(text),eglAcceptor(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* function(parse,[bsl(text)],[bsl(term)],eglParser(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* function(parse,[bsl(text)],[bsl(term)],eglParser(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* membership(bsl(term),eslLanguage,['languages/BSL/as.term'])
* function(conformsTo,[term,bsl(term)],[],bslConformance,[])
* function(interpret,[bstl(term),bsl(term)],[bsl(term)],bstlSig:interpret,[])
* function(interpret,[bstl(term),bsl(term)],[bsl(term)],bstlSig:interpret,[])

## Elements
* [languages/BNL/as.bsl](../files/languages-BNL-as.bsl.md)
* [languages/BNL/as.term](../files/languages-BNL-as.term.md)
* [languages/BSL/sample.term](../files/languages-BSL-sample.term.md)
* [languages/BSTL/tests/sig1.bsl](../files/languages-BSTL-tests-sig1.bsl.md)
* [languages/BSTL/tests/sig2.bsl](../files/languages-BSTL-tests-sig2.bsl.md)
* [languages/BSTL/tests/sig1.term](../files/languages-BSTL-tests-sig1.term.md)
* [languages/BSTL/tests/sig2.term](../files/languages-BSTL-tests-sig2.term.md)
* [languages/BTL/as.bsl](../files/languages-BTL-as.bsl.md)
* [languages/BTL/as.term](../files/languages-BTL-as.term.md)
* [samples/obsolete/expr/as.bsl](../files/samples-obsolete-expr-as.bsl.md)
* [samples/obsolete/expr/as.term](../files/samples-obsolete-expr-as.term.md)
