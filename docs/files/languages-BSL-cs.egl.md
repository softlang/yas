# File _languages/BSL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/cs.egl)**
```
signature : { symbol ';' }* ;
symbol : 'symbol' name ':' args '->' name ;
args : { name { '#' name }* }? ;
```
