# File _languages/DDL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/DDL/cs.egl)**
```
schema : { table }+ ;

table : 'CREATE' 'TABLE' name '(' { column { ',' column }* }? ')' ';' ;

column : name type { clause }* ;

[integer] type : 'INTEGER' ;
...
```
