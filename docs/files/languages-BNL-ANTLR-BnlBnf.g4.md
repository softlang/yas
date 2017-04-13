# File _languages/BNL/ANTLR/BnlBnf.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/ANTLR/BnlBnf.g4)**
```
grammar BnlBnf;
@header {package org.softlang.bnl;}

number 	: bits rest WS? EOF;
bits 	: bit | bits bit;
bit 	: '0' | '1';
rest 	: | '.' bits;
WS : [ \t\n\r]+ ;
```

## Languages
* [ANTLR](../languages/ANTLR.md) (antlr(text))

## References
* elementOf('languages/BNL/ANTLR/BnlBnf.g4',antlr(text))
