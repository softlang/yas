# File _languages/BSL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/ls.egl)**
```
qstring : quote { noQuote }+ quote ;
name : { alpha }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/BSL/ls.egl',egl(text))
* mapsTo(parse,['languages/BSL/ls.egl'],['languages/BSL/ls.term'])
