# File _languages/BNL/ANTLR/BnlEbnf.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/ANTLR/BnlEbnf.g4)**
```
grammar BnlEbnf;
@header {package org.softlang.bnl;}

number 	: bit+ ('.' bit+)? WS? EOF;
bit 	: '0' | '1';
WS : [ \t\n\r]+ ;
```
