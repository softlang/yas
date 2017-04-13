# File _languages/FSML/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/cs.term)**
```
[ ([],fsm,[star([n(state)])]), ([],state,[option([t(initial)]),t(state),n(stateid),t('{'),star([n(transition)]),t('}')]), ([],transition,[n(event),option([t(/),n(action)]),option([t(->),n(stateid)]),t(;)]), ([],stateid,[n(name)]), ([],event,[n(name)]), ([],action,[n(name)])].
```

## Languages
* [EGL](../languages/EGL.md) (egl(term))

## References
* membership(fsml(text),eglAcceptor(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* function(parse,[fsml(text)],[fsml(term)],eglParser(fsmlAbstract: (~>)),['languages/FSML/cs.term','languages/FSML/ls.term'])
* elementOf('languages/FSML/cs.term',egl(term))
* mapsTo(parse,['languages/FSML/cs.egl'],['languages/FSML/cs.term'])
