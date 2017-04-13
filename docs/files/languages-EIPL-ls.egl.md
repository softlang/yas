# File _languages/EIPL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/ls.egl)**
```
name : { alpha }+ ;
integer : { digit }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/EIPL/ls.egl',egl(text))
* mapsTo(parse,['languages/EIPL/ls.egl'],['languages/EIPL/ls.term'])
