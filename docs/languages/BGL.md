# Language _BGL (Basic Grammar Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL)**

A BNF-like notation for context-free grammars; rules (productions) are labeled.

## Purposes
* Concrete textual syntax definition
* Concrete syntax definition
* Language definition

## Links
* subsetOf: [EGL](http://softlang.github.io/yas/languages/EGL.html)
* similarTo: [https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form](https://en.wikipedia.org/wiki/Backus%E2%80%93Naur_form)

## Representations
* bgl(text)
* bgl(term)

## References
* membership(bgl(text),elementOfBgl,[])
* function(parse,[bgl(text)],[bgl(term)],parserOfBgl,[])
* function(parse,[bgl(text)],[bgl(term)],parserOfBgl,[])
* function(project,[bgl(term)],[bsl(term)],bglToBsl: (~>),[])
* function(acceptBottomUp,[bgl(term),term],[],bglAcceptBottomUp:accept,[])
* function(acceptTopDown,[bgl(term),term],[],bglAcceptTopDown:accept,[])
* function(parseTopDown,[bgl(term),term],[term],bglParseTopDown:parse,[])
* membership(bgl(text),eglAcceptor(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* function(parse,[bgl(text)],[bgl(term)],eglParser(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* function(parse,[bgl(text)],[bgl(term)],eglParser(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* membership(bgl(term),eslLanguage,['languages/BGL/as.term'])
* function(conformsTo,[tokens(term),bgl(term)],[],bglConformance,[])

## Elements
* [languages/BNL/cs.bgl](../files/languages-BNL-cs.bgl.md)
* [languages/BNL/cs.term](../files/languages-BNL-cs.term.md)
* [languages/BTL/cs.bgl](../files/languages-BTL-cs.bgl.md)
* [languages/BTL/cs.term](../files/languages-BTL-cs.term.md)
* [samples/obsolete/expr/cs.bgl](../files/samples-obsolete-expr-cs.bgl.md)
* [samples/obsolete/expr/cs.term](../files/samples-obsolete-expr-cs.term.md)
