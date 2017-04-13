# File _languages/EFPL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/ls.egl)**
```
name : lower { alpha }* ;
integer : { digit }+ ;
layout : { space }+ ;
layout : '--' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/EFPL/ls.egl',egl(text))
* mapsTo(parse,['languages/EFPL/ls.egl'],['languages/EFPL/ls.term'])
