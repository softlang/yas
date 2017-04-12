# File _languages/EL/Haskell/Language/EL/QQ/Rules/Simplify.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/QQ/Rules/Simplify.hs)**
```
-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
module Language.EL.QQ.Rules.Simplify where
import Language.EL.QQ.Syntax hiding (MetaVar)
import Language.EL.QuasiQuoter
-- END ...
simplify :: Expr -> Maybe Expr
simplify [el| $x + 0 |] = Just [el| $x |]
simplify [el| $x * 1 |] = Just [el| $x |]
simplify [el| $x * 0 |] = Just [el| 0 |]
simplify _ = Nothing
```
