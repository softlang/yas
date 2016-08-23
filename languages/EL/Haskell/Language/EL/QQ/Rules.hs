-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
module Language.EL.QQ.Rules where
import Language.EL.QQ.Syntax hiding (MetaVar)
import Language.EL.QuasiQuoter
-- END ...
-- Simplify expression
simplify :: Expr -> Maybe Expr
simplify [el| $x + 0 |] = Just x
simplify [el| $x * 1 |] = Just x
simplify [el| $x * 0 |] = Just $ IntConst 0
simplify _ = Nothing

-- Apply commutativity laws
commute :: Expr -> Maybe Expr
commute [el| $x + $y |] = Just [el| $y + $x |]
commute [el| $x * $y |] = Just [el| $y * $x |]
commute _ = Nothing

-- Move parentheses from left to right
associate :: Expr -> Maybe Expr
associate [el| ($x + $y) + $z |] = Just [el| $x + ($y + $z) |]
associate [el| ($x * $y) * $z |] = Just [el| $x * ($y * $z) |]
associate _ = Nothing
