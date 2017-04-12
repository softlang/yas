# File _languages/EL/Haskell/Language/EL/QQ/Rules/Associate.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/QQ/Rules/Associate.hs)**
```
-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
module Language.EL.QQ.Rules.Associate where
import Language.EL.QQ.Syntax hiding (MetaVar)
import Language.EL.QuasiQuoter
-- END ...
associate :: Expr -> Maybe Expr
associate [el| ($x + $y) + $z |] = Just [el| $x + ($y + $z) |]
associate [el| ($x * $y) * $z |] = Just [el| $x * ($y * $z) |]
associate _ = Nothing
```
