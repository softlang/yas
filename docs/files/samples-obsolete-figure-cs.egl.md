# File _samples/obsolete/figure/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/figure/cs.egl)**
```
figure : {element ';'}* ;
[line] element : 'line' 'from' ':' point ',' 'to' ':' point ;
[circle ] element : 'circle' 'origin' ':' point ',' 'radius' ':' integer ;
point : '(' integer ',' integer ')' ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('samples/obsolete/figure/cs.egl',egl(text))
* mapsTo(parse,['samples/obsolete/figure/cs.egl'],['samples/obsolete/figure/cs.term'])
