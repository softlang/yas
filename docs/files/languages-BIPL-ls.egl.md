# File _languages/BIPL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/ls.egl)**
```
name : { alpha }+ ;
integer : { digit }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/BIPL/ls.egl',egl(text))
* mapsTo(parse,['languages/BIPL/ls.egl'],['languages/BIPL/ls.term'])
