# File _languages/BNL/EGL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/EGL/cs.egl)**
```
[number] number :  { bit }+ { '.' { bit }+ }? ;
[zero] bit : '0' ;
[one] bit : '1' ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/BNL/EGL/cs.egl',egl(text))
* mapsTo(parse,['languages/BNL/EGL/cs.egl'],['languages/BNL/EGL/cs.term'])
