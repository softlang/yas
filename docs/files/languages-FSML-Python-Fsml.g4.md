# File _languages/FSML/Python/Fsml.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Python/Fsml.g4)**
```
grammar Fsml;
options {language=Python2;}
@header {from FsmlModel import Fsm}
fsm :
   {self._errHandler = BailErrorStrategy()}
   {self.model = Fsm()}
   statedecl+ EOF
...
```

## Languages
* [ANTLR](../languages/ANTLR.md) (antlr(text))

## References
* elementOf('languages/FSML/Python/Fsml.g4',antlr(text))
