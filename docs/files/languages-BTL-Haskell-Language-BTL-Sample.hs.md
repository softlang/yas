# File _languages/BTL/Haskell/Language/BTL/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Haskell/Language/BTL/Sample.hs)**
```
-- BEGIN ...
module Language.BTL.Sample where

import Language.BTL.Syntax
-- END ...
sampleExpr :: Expr
sampleExpr = Pred (If (IsZero Zero) (Succ Zero) Zero)
-- BEGIN ...
illtypedSampleExpr :: Expr
illtypedSampleExpr = Succ TRUE
-- END ...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BTL/Haskell/Language/BTL/Sample.hs',haskell(text))
