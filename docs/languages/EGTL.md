# Language _EGTL (Extended Grammar Transformation Language)_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL)**

A trivial transformation language for grammars.

## Purposes
* Grammar transformation

## Links
* dependsOn: [EGL](http://softlang.github.io/yas/languages/EGL.html)

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
* [languages/EGTL/samples/bgl2egl.egtl](../files/languages-EGTL-samples-bgl2egl.egtl.md)
* [languages/EGTL/samples/bgl2egl.term](../files/languages-EGTL-samples-bgl2egl.term.md)
