# Language _EGTL (Extended Grammar Transformation Language)_
A trivial transformation language for grammars.

## Purposes
* Grammar transformation

## Links
* dependsOn(egl)

## Representations
* egtl(text)
* egtl(term)

## References
* membership(egtl(text),eglAcceptor(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* function(parse,[egtl(text)],[egtl(term)],eglParser(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* function(parse,[egtl(text)],[egtl(term)],eglParser(egtlAbstract: (~>)),['languages/EGTL/cs.term','languages/EGTL/ls.term'])
* membership(egtl(term),eslLanguage,['languages/EGTL/as.term'])
* function(interpret,[egtl(term),egl(term)],[egl(term)],egtlInterpret:interpret,[])

## Elements
* [languages/EGTL/samples/bgl2egl.egtl](../../languages/EGTL/samples/bgl2egl.egtl)
* [languages/EGTL/samples/bgl2egl.term](../../languages/EGTL/samples/bgl2egl.term)
