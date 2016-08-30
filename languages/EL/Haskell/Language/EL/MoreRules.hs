-- BEGIN ...
module Language.EL.MoreRules where
import Language.EL.Syntax
import Language.EL.Rules
import Control.Monad
-- END ...
-- Cancel double negation on Ints
doubleNegate (Unary Negate (Unary Negate e)) = Just e
doubleNegate (Unary Negate (IntConst i)) | i <= 0 = Just (IntConst (-i))
doubleNegate _ = Nothing

-- Swap variable names
swap x y (Var z) | z == x = Just (Var y)
swap x y (Var z) | z == y = Just (Var x)
swap _ _ _ = Nothing

-- Compose simplification with optional commute
simplify' x = simplify x `mplus` commute x >>= simplify
