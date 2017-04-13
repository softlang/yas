# File _languages/TBL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/ls.egl)**
```
name : { alpha }+ ;
integer : { digit }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/TBL/ls.egl',egl(text))
* mapsTo(parse,['languages/TBL/ls.egl'],['languages/TBL/ls.term'])
