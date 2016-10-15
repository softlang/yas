-- BEGIN ...
module Language.EL.Rules.Commute where
import Language.EL.Syntax
-- END ...
commute :: Expr -> Maybe Expr
commute (Binary Add x y) = Just $ Binary Add y x
commute (Binary Mul x y) = Just $ Binary Mul y x
commute _ = Nothing
