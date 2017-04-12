# File _languages/LAL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/ls.egl)**
```
name : csymf { csym }* ;
url : quote { { quote }~ }+ quote ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```
