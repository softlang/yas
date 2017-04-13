# File _languages/BSL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/cs.term)**
```
[ ([],signature,[star([n(symbol),t(;)])]), ([],symbol,[t(symbol),n(name),t(:),n(args),t(->),n(name)]), ([],args,[option([n(name),star([t(#),n(name)])])])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(bsl(text),eglAcceptor(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* function(parse,[bsl(text)],[bsl(term)],eglParser(bslAbstract: (~>)),['languages/BSL/cs.term','languages/BSL/ls.term'])
* elementOf('languages/BSL/cs.term',egl(term))
* mapsTo(parse,['languages/BSL/cs.egl'],['languages/BSL/cs.term'])
