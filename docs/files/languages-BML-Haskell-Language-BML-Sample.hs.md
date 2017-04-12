# File _languages/BML/Haskell/Language/BML/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BML/Haskell/Language/BML/Sample.hs)**
```
-- BEGIN ...
module Language.BML.Sample where
import Language.BML.Syntax
-- END ...
euclideanDiv = [Const 14,Store 0,Const 4,Store 1,Const 0,Store 2,Load 0,Store 3,Load 3,Load 1,Geq,Not,CJump 22,Load 3,Load 1,Sub,Store 3,Load 2,Const 1,Add,Store 2,Jump 8]
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BML/Haskell/Language/BML/Sample.hs',haskell(text))
