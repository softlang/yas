# File _languages/TLL/Haskell/Language/TLL/Erasure.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TLL/Haskell/Language/TLL/Erasure.hs)**
```
-- BEGIN ...
module Language.TLL.Erasure where
-- END ...
import Language.TLL.Syntax as TLL
import Language.ULL.Syntax as ULL
erase :: TLL.Expr -> ULL.Expr
erase (TLL.Var x) = (ULL.Var x)
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/TLL/Haskell/Language/TLL/Erasure.hs',haskell(text))
