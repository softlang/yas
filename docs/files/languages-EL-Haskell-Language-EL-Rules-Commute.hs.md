# File _languages/EL/Haskell/Language/EL/Rules/Commute.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/Rules/Commute.hs)**
```
-- BEGIN ...
module Language.EL.Rules.Commute where
import Language.EL.Syntax
-- END ...
commute :: Expr -> Maybe Expr
commute (Binary Add x y) = Just $ Binary Add y x
commute (Binary Mul x y) = Just $ Binary Mul y x
commute _ = Nothing
```
