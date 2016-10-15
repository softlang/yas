-- BEGIN ...
module Language.EL.Rules.Associate where
import Language.EL.Syntax
-- END ...
associate :: Expr -> Maybe Expr
associate (Binary Add (Binary Add x y) z) =
  Just $ Binary Add x (Binary Add y z)
associate (Binary Mul (Binary Mul x y) z) =
  Just $ Binary Mul x (Binary Mul y z)
associate _ = Nothing
