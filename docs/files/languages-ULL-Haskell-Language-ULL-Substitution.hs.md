# File _languages/ULL/Haskell/Language/ULL/Substitution.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ULL/Haskell/Language/ULL/Substitution.hs)**
```
-- BEGIN ...
module Language.ULL.Substitution where
import Language.ULL.Syntax
-- END ...
substitute :: Expr -> String -> Expr -> Maybe Expr
substitute e x (Var y) | x == y = Just e
substitute e x (Var y) | x /= y = Just (Var y)
...
```
