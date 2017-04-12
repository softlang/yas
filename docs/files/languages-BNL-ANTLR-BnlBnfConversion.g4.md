# File _languages/BNL/ANTLR/BnlBnfConversion.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/ANTLR/BnlBnfConversion.g4)**
```
grammar BnlBnfConversion;
@header {package org.softlang.bnl;}

number returns [float val]
    : bits rest WS? EOF { $val = $bits.val + $rest.val; }
    ;
bits returns [float val, int len]
...
```
