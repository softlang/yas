# File _languages/BGL/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/ls.egl)**
```
qstring : quote { { quote }~ }+ quote ;
name : { alpha }+ ;
layout : { space }+ ;
layout : '//' { { end_of_line }~ }* end_of_line ;
```
