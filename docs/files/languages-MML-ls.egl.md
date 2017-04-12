# File _languages/MML/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/ls.egl)**
```
name : { csymf }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/MML/ls.egl',egl(text))
* mapsTo(parse,['languages/MML/ls.egl'],['languages/MML/ls.term'])
