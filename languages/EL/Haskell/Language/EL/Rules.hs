-- BEGIN ...
module Language.EL.Rules where
import Language.EL.Syntax
-- END ...
-- Simplify expression
simplify :: Expr -> Maybe Expr
simplify (Binary Add x (IntConst 0)) = Just x
simplify (Binary Mul x (IntConst 1)) = Just x
simplify (Binary Mul x (IntConst 0)) = Just $ IntConst 0
simplify _ = Nothing

-- Apply commutativity laws
commute :: Expr -> Maybe Expr
commute (Binary Add x y) = Just $ Binary Add y x
commute (Binary Mul x y) = Just $ Binary Mul y x
commute _ = Nothing

-- Move parentheses from left to right
associate :: Expr -> Maybe Expr
associate (Binary Add (Binary Add x y) z) =
  Just $ Binary Add x (Binary Add y z)
associate (Binary Mul (Binary Mul x y) z) =
  Just $ Binary Mul x (Binary Mul y z)
associate _ = Nothing
