-- BEGIN ...
module Language.BTL.SmallStepWithGuards where
import Language.BTL.Syntax
import Language.BTL.ValueExpr
-- One-step reduction of terms
-- END ...
step :: Expr -> Maybe Expr
step (Succ e) | Just e' <- step e = Just (Succ e')
step (Pred e) | Just e' <- step e = Just (Pred e')
step (Pred Zero) = Just Zero
step (Pred (Succ n)) | isNat n = Just n
step (IsZero e) | Just e' <- step e = Just (IsZero e')
step (IsZero Zero) = Just TRUE
step (IsZero (Succ n)) | isNat n = Just FALSE
step (If e0 e1 e2) | Just e0' <- step e0 = Just (If e0' e1 e2)
step (If TRUE e1 e2) = Just e1
step (If FALSE e1 e2) = Just e2
step _ = Nothing
