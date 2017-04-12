# File _languages/BIPL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/cs.egl)**
```
// Statements
[skip] stmt : ';' ;
[assign] stmt : name '=' expr ';' ;
[block] stmt : '{' { stmt }* '}' ;
[if] stmt : 'if' '(' expr ')' stmt { 'else' stmt }? ;
[while] stmt : 'while' '(' expr ')' stmt ;

...
```
