# File _languages/EGL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/cs.term)**
```
[ ([],grammar,[star([n(rule)])]), ([],rule,[option([t('['),n(label),t(']')]),n(nonterminal),t(:),n(gsymbols),t(;)]), ([],gsymbols,[star([n(gsymbol)])]), ([t],gsymbol,[n(terminal)]), ([n],gsymbol,[n(nonterminal)]), ([star],gsymbol,[t('{'),n(gsymbols),t('}'),t(*)]), ([plus],gsymbol,[t('{'),n(gsymbols),t('}'),t(+)]), ([option],gsymbol,[t('{'),n(gsymbols),t('}'),t(?)]), ([not],gsymbol,[t('{'),n(gsymbols),t('}'),t(~)]), ([],label,[n(name)]), ([],terminal,[n(qstring)]), ([],nonterminal,[n(name)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(egl(text),eglAcceptor(eglAbstract: (~>)),['languages/EGL/cs.term','languages/EGL/ls.term'])
* function(parse,[egl(text)],[egl(term)],eglParser(eglAbstract: (~>)),['languages/EGL/cs.term','languages/EGL/ls.term'])
* elementOf('languages/EGL/cs.term',egl(term))
* mapsTo(parse,['languages/EGL/cs.egl'],['languages/EGL/cs.term'])
* mapsTo(interpret,['languages/EGTL/samples/bgl2egl.term','languages/BGL/cs.term'],['languages/EGL/cs.term'])
