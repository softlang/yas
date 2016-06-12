-- BEGIN ...
module Language.BTL.BigStepWithGuards where

import Language.BTL.Syntax
import Language.BTL.Nf
-- END ...
-- Evaluation of terms
evaluate :: Term -> Maybe Term
evaluate TRUE = Just TRUE
evaluate FALSE = Just FALSE
evaluate Zero = Just Zero
evaluate (Succ t)
  | Just n <- evaluate t
  , isNat n
  = Just (Succ n)
evaluate (Pred t)
  | Just Zero <- evaluate t
  = Just Zero
evaluate (Pred t)
  | Just (Succ n) <- evaluate t
  , isNat n
  = Just n
evaluate (IsZero t)
  | Just Zero <- evaluate t
  = Just TRUE
evaluate (IsZero t)
  | Just (Succ n) <- evaluate t
  , isNat n
  = Just FALSE
evaluate (If t0 t1 t2)
  | Just TRUE <- evaluate t0
  = evaluate t1
evaluate (If t0 t1 t2)
  | Just FALSE <- evaluate t0
  = evaluate t2
evaluate _ = Nothing
