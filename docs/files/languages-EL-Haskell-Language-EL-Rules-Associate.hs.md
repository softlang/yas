# File _languages/EL/Haskell/Language/EL/Rules/Associate.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/Rules/Associate.hs)**
```
-- BEGIN ...
module Language.EL.Rules.Associate where
import Language.EL.Syntax
-- END ...
associate :: Expr -> Maybe Expr
associate (Binary Add (Binary Add x y) z) = Just $ Binary Add x (Binary Add y z)
associate (Binary Mul (Binary Mul x y) z) = Just $ Binary Mul x (Binary Mul y z)
associate _ = Nothing
```
