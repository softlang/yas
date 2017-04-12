# File _languages/BFPL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/ls.egl)**
```
name : lower { alpha }* ;
integer : { digit }+ ;
layout : { space }+ ;
layout : '--' { { end_of_line }~ }* end_of_line ;
```
