# File _languages/EGTL/samples/bgl2egl.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/samples/bgl2egl.term)**
```
sequ([generalize(([],rule,[t('['),n(label),t(']'),n(nonterminal),t(:),n(gsymbols),t(;)]), ([],rule,[option([t('['),n(label),t(']')]),n(nonterminal),t(:),n(gsymbols),t(;)])),add(([star],gsymbol,[t('{'),n(gsymbols),t('}'),t(*)])),add(([plus],gsymbol,[t('{'),n(gsymbols),t('}'),t(+)])),add(([option],gsymbol,[t('{'),n(gsymbols),t('}'),t(?)])),add(([not],gsymbol,[t('{'),n(gsymbols),t('}'),t(~)]))]).
```

## Languages
* [EGTL](../languages/EGTL.md) (egtl(term))

## References
* elementOf('languages/EGTL/samples/bgl2egl.term',egtl(term))
* mapsTo(parse,['languages/EGTL/samples/bgl2egl.egtl'],['languages/EGTL/samples/bgl2egl.term'])
* elementOf('languages/EGTL/samples/bgl2egl.term',extension(egtl(term)))
* mapsTo(interpret,['languages/EGTL/samples/bgl2egl.term','languages/BGL/cs.term'],['languages/EGL/cs.term'])
