# File _languages/BGL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/cs.term)**
```
[ ([],grammar,[star([n(rule)])]), ([],rule,[t('['),n(label),t(']'),n(nonterminal),t(:),n(gsymbols),t(;)]), ([],gsymbols,[star([n(gsymbol)])]), ([t],gsymbol,[n(terminal)]), ([n],gsymbol,[n(nonterminal)]), ([],label,[n(name)]), ([],terminal,[n(qstring)]), ([],nonterminal,[n(name)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bgl(text),eglAcceptor(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* function(parse,[bgl(text)],[bgl(term)],eglParser(bglAbstract: (~>)),['languages/BGL/cs.term','languages/BGL/ls.term'])
* elementOf('languages/BGL/cs.term',egl(term))
* mapsTo(parse,['languages/BGL/cs.egl'],['languages/BGL/cs.term'])
* mapsTo(interpret,['languages/EGTL/samples/bgl2egl.term','languages/BGL/cs.term'],['languages/EGL/cs.term'])
