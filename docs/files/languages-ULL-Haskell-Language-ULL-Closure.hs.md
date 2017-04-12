# File _languages/ULL/Haskell/Language/ULL/Closure.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ULL/Haskell/Language/ULL/Closure.hs)**
```
-- BEGIN ...
module Language.ULL.Closure where

import Language.ULL.Syntax
import Language.ULL.Value
import Language.ULL.SmallStep
-- END ...
steps :: Expr -> Maybe Expr
steps e =
  if isValue e
    then Just e
    else case step e of
           (Just e') -> steps e'
           Nothing -> Nothing
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/ULL/Haskell/Language/ULL/Closure.hs',haskell(text))
