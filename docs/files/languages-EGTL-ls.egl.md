# File _languages/EGTL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/ls.egl)**
```
qstring : quote { { quote }~ }+ quote ;
name : { csymf }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```
