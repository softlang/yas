-- BEGIN ...
module Language.BTL.BigStep where
import Language.BTL.Syntax
import Language.BTL.ValueExpr
-- END ...
evaluate :: Expr -> Expr
evaluate TRUE = TRUE
evaluate FALSE = FALSE
evaluate Zero = Zero
evaluate (Succ e) =
  let n = evaluate e in
    if isNat n then Succ n else undefined
evaluate (Pred e) =
  case evaluate e of
    Zero -> Zero
    (Succ n) -> if isNat n then n else undefined
evaluate (IsZero e) =
  case evaluate e of
    Zero -> TRUE
    (Succ n) -> if isNat n then FALSE else undefined
evaluate (If e0 e1 e2) =
  case evaluate e0 of
    TRUE -> evaluate e1
    FALSE -> evaluate e2
