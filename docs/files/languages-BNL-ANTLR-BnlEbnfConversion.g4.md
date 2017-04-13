# File _languages/BNL/ANTLR/BnlEbnfConversion.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/ANTLR/BnlEbnfConversion.g4)**
```
grammar BnlEbnfConversion;
@header {package org.softlang.bnl;}

number returns [float val] :
 	{ $val = 0; } 
	( bit1=bit { $val = $val*2 + $bit1.val; } )+ 
	('.'
...
```

## Languages
* [ANTLR](../languages/ANTLR.md) (antlr(text))

## References
* elementOf('languages/BNL/ANTLR/BnlEbnfConversion.g4',antlr(text))
