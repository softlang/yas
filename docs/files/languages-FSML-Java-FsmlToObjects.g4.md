# File _languages/FSML/Java/FsmlToObjects.g4_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Java/FsmlToObjects.g4)**
```
grammar FsmlToObjects;
@header {package org.softlang.fsml;}
@members {public Fsm fsm = new Fsm();}

fsm : state+ EOF ;
state : 
  { boolean initial = false; } 
...
```

## Languages
* [ANTLR](../languages/ANTLR.md) (antlr(text))

## References
* elementOf('languages/FSML/Java/FsmlToObjects.g4',antlr(text))
