# File _samples/obsolete/figure/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/figure/cs.term)**
```
[
  ([], figure, [star([n(element), t(';')])]),
  ([line], element, [
     t('line'),
     t('from'), t(':'), n(point),
     t(','),
     t('to'), t(':'), n(point)
...
```

## Languages
* [EGL](../languages/EGL.md)

## References
* membership(figure(text),eglAcceptor(figureAbstract: (~>)),['samples/obsolete/figure/cs.term','samples/obsolete/figure/ls.term'])
* function(parse,[figure(text)],[figure(term)],eglParser(figureAbstract: (~>)),['samples/obsolete/figure/cs.term','samples/obsolete/figure/ls.term'])
* elementOf('samples/obsolete/figure/cs.term',egl(term))
* mapsTo(parse,['samples/obsolete/figure/cs.egl'],['samples/obsolete/figure/cs.term'])
* function(scannerless,[figure(text)],[figure(term)],eglParserScannerless(layout,figureAbstract: (~>)),['samples/obsolete/figure/cs.term','samples/obsolete/figure/ls.term'])
* function(scannerfull,[figure(tokens(term))],[figure(term)],eglParserScannerfull(figureAbstract: (~>)),['samples/obsolete/figure/cs.term'])
