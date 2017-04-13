# File _languages/ESL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/ls.egl)**
```
name : { csymf }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/ESL/ls.egl',egl(text))
* mapsTo(parse,['languages/ESL/ls.egl'],['languages/ESL/ls.term'])
