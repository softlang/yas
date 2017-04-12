# File _languages/FSML/Java/Fsml.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Java/Fsml.g4)**
```
grammar Fsml;
@header {package org.softlang.fsml;}
fsm : state+ EOF ;
state : 'initial'? 'state' stateid '{' transition* '}' ;
transition : event ('/' action)? ('->' target=stateid)? ';' ;
stateid : NAME ;
event : NAME ;
action : NAME ;
NAME : ('a'..'z'|'A'..'Z')+ ;
WS : [ \t\n\r]+ -> skip ;
```

## Languages
* [ANTLR](../languages/ANTLR.md)

## References
* elementOf('languages/FSML/Java/Fsml.g4',antlr(text))
