# File _languages/BFPL/Haskell/Language/BFPL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Haskell/Language/BFPL/Syntax.hs)**
```
-- BEGIN ...
module Language.BFPL.Syntax where
-- END ...
-- Program = typed functions + main expression
type Program = (Functions, Expr)
type Functions = [Function]
type Function = (String, (FunSig, FunDef))
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BFPL/Haskell/Language/BFPL/Syntax.hs',haskell(text))
