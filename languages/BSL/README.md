# Language _BSL (Basic Signature Language)_
A basic specification language for tree-based abstract syntax on the grounds of many-sorted signatures.

## Purposes
* Tree-based abstract syntax definition
* Abstract syntax definition
* Language definition

## Links
* subsetOf(esl)

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
* [languages/BNL/as.bsl](../../languages/BNL/as.bsl)
* [languages/BNL/as.term](../../languages/BNL/as.term)
* [languages/BSL/sample.term](../../languages/BSL/sample.term)
* [languages/BSTL/tests/sig1.bsl](../../languages/BSTL/tests/sig1.bsl)
* [languages/BSTL/tests/sig2.bsl](../../languages/BSTL/tests/sig2.bsl)
* [languages/BSTL/tests/sig1.term](../../languages/BSTL/tests/sig1.term)
* [languages/BSTL/tests/sig2.term](../../languages/BSTL/tests/sig2.term)
* [languages/BTL/as.bsl](../../languages/BTL/as.bsl)
* [languages/BTL/as.term](../../languages/BTL/as.term)
* [samples/obsolete/expr/as.bsl](../../samples/obsolete/expr/as.bsl)
* [samples/obsolete/expr/as.term](../../samples/obsolete/expr/as.term)
