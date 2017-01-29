-- BEGIN ...
module Language.BTL.BigStepWithGuards where

import Language.BTL.Syntax
import Language.BTL.ValueExpr
-- END ...
evaluate :: Expr -> Expr
evaluate TRUE = TRUE
evaluate FALSE = FALSE
evaluate Zero = Zero
evaluate (Succ e)
  | n <- evaluate e
  , isNat n
  = Succ n
evaluate (Pred e)
  | Zero <- evaluate e
  = Zero
evaluate (Pred e)
  | Succ n <- evaluate e
  , isNat n
  = n
evaluate (IsZero e)
  | Zero <- evaluate e
  = TRUE
evaluate (IsZero e)
  | Succ n <- evaluate e
  , isNat n
  = FALSE
evaluate (If e0 e1 e2)
  | TRUE <- evaluate e0
  = evaluate e1
evaluate (If e0 e1 e2)
  | FALSE <- evaluate e0
  = evaluate e2
