# File _languages/EL/Haskell/Language/EL/QQ/Rules/Commute.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/QQ/Rules/Commute.hs)**
```
-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
module Language.EL.QQ.Rules.Commute where
import Language.EL.QQ.Syntax hiding (MetaVar)
import Language.EL.QuasiQuoter
-- END ...
commute :: Expr -> Maybe Expr
commute [el| $x + $y |] = Just [el| $y + $x |]
commute [el| $x * $y |] = Just [el| $y * $x |]
commute _ = Nothing
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/EL/Haskell/Language/EL/QQ/Rules/Commute.hs',haskell(text))
