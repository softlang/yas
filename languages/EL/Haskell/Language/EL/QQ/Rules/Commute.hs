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
