# File _languages/MML/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/cs.term)**
```
[ ([],metamodel,[star([n(classifier)])]), ([datatype],classifier,[t(datatype),n(name),t(;)]), ([class],classifier,[n(abstract),t(class),n(name),n(super),n(members)]), ([],super,[option([t(extends),n(name)])]), ([abstract],abstract,[t(abstract)]), ([concrete],abstract,[]), ([],members,[t('{'),star([n(member)]),t('}')]), ([],member,[n(kind),n(name),t(:),n(type),t(;)]), ([value],kind,[t(value)]), ([part],kind,[t(part)]), ([reference],kind,[t(reference)]), ([],type,[n(name),n(cardinality)]), ([plus],cardinality,[t(+)]), ([star],cardinality,[t(*)]), ([option],cardinality,[t(?)]), ([one],cardinality,[])].
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(mml(text),eglAcceptor(mmlAbstract: (~>)),['languages/MML/cs.term','languages/MML/ls.term'])
* function(parse,[mml(text)],[mml(term)],eglParser(mmlAbstract: (~>)),['languages/MML/cs.term','languages/MML/ls.term'])
* elementOf('languages/MML/cs.term',egl(term))
* mapsTo(parse,['languages/MML/cs.egl'],['languages/MML/cs.term'])
