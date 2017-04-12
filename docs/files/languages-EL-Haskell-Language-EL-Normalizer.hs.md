# File _languages/EL/Haskell/Language/EL/Normalizer.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/Normalizer.hs)**
```
-- BEGIN ...
module Language.EL.Normalizer where
import Language.EL.Syntax
-- END ...
normalize :: (Expr -> Maybe Expr) -> Expr -> Expr
normalize f e = let e' = pass e in if e==e' then e else normalize f e'
  where
    -- Apply one pass of normalization
    pass e = sub (maybe e id (f e))
    -- Push normalization into subexpressions
    sub (Unary o e) = Unary o (pass e)
    sub (Binary o e1 e2) = Binary o (pass e1) (pass e2)
    sub e = e
```
