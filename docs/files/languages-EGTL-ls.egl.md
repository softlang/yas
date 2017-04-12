# File _languages/EGTL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/ls.egl)**
```
qstring : quote { { quote }~ }+ quote ;
name : { csymf }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/EGTL/ls.egl',egl(text))
* mapsTo(parse,['languages/EGTL/ls.egl'],['languages/EGTL/ls.term'])
