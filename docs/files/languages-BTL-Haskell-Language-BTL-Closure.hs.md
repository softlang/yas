# File _languages/BTL/Haskell/Language/BTL/Closure.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Haskell/Language/BTL/Closure.hs)**
```
-- BEGIN ...
module Language.BTL.Closure where
import Language.BTL.Syntax
import Language.BTL.ValueExpr
-- END ...
steps :: (Expr -> Maybe Expr) -> Expr -> Maybe Expr
steps f e =
  if isValue e
    then Just e
    else case f e of
           (Just e') -> steps f e'
           Nothing -> Nothing
```
