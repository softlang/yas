# File _languages/BNL/EGL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/EGL/cs.term)**
```
[ ([number],number,[plus([n(bit)]),option([t('.'),plus([n(bit)])])]), ([zero],bit,[t('0')]), ([one],bit,[t('1')])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(yabnl(text),eglAcceptor(yabnlAbstract: (~>)),['languages/BNL/EGL/cs.term','languages/BNL/EGL/ls.term'])
* function(parse,[yabnl(text)],[yabnl(term)],eglParser(yabnlAbstract: (~>)),['languages/BNL/EGL/cs.term','languages/BNL/EGL/ls.term'])
* elementOf('languages/BNL/EGL/cs.term',egl(term))
* mapsTo(parse,['languages/BNL/EGL/cs.egl'],['languages/BNL/EGL/cs.term'])
