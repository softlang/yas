-- BEGIN ...
module Language.BTL.BigStepWithGuards where

import Language.BTL.Syntax
import Language.BTL.Nf
-- END ...
-- Evaluation of terms
evaluate :: Expr -> Maybe Expr
evaluate TRUE = Just TRUE
evaluate FALSE = Just FALSE
evaluate Zero = Just Zero
evaluate (Succ e)
  | Just n <- evaluate e
  , isNat n
  = Just (Succ n)
evaluate (Pred e)
  | Just Zero <- evaluate e
  = Just Zero
evaluate (Pred e)
  | Just (Succ n) <- evaluate e
  , isNat n
  = Just n
evaluate (IsZero e)
  | Just Zero <- evaluate e
  = Just TRUE
evaluate (IsZero e)
  | Just (Succ n) <- evaluate e
  , isNat n
  = Just FALSE
evaluate (If e0 e1 e2)
  | Just TRUE <- evaluate e0
  = evaluate e1
evaluate (If e0 e1 e2)
  | Just FALSE <- evaluate e0
  = evaluate e2
evaluate _ = Nothing
