# File _languages/TBL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/cs.egl)**
```
world : { person }* ;
person : name { '->' name }? ;
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/TBL/cs.egl',egl(text))
* mapsTo(parse,['languages/TBL/cs.egl'],['languages/TBL/cs.term'])
