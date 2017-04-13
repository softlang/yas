# File _languages/DDL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL/ls.egl)**
```
name : lower { csym }* ;
integer : { digit }+ ;
layout : { space }+ ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/DDL/ls.egl',egl(text))
* mapsTo(parse,['languages/DDL/ls.egl'],['languages/DDL/ls.term'])
