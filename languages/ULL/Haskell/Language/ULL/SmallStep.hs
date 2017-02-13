-- BEGIN ...
module Language.ULL.SmallStep where
import Language.ULL.Syntax
import Language.ULL.Substitution
import Language.ULL.Value
-- END ...
step :: Expr -> Maybe Expr
step (Apply e1 e2) | not (isValue e1) =
  step e1 >>= \e1' -> Just (Apply e1' e2)
step (Apply e1 e2) | isValue e1 && not (isValue e2) =
  step e2 >>= \e2' -> Just (Apply e1 e2')
step (Apply (Lambda x e1) e2) | isValue e2 =
  substitute e2 x e1
step (Fix e) | not (isValue e), Just e' <- step e = Just (Fix e')
step e@(Fix (Lambda x e')) = substitute e x e'
-- ...
-- BEGIN ...
step (Succ e) | not (isValue e), Just e' <- step e = Just (Succ e')
step (Pred e) | not (isValue e), Just e' <- step e = Just (Pred e')
step (Pred Zero) = Just Zero
step (Pred (Succ e)) | isNat e = Just e
step (IsZero e) | not (isValue e), Just e' <- step e = Just (IsZero e')
step (IsZero Zero) = Just TRUE
step (IsZero (Succ e)) | isNat e = Just FALSE
step (If e1 e2 e3) | not (isValue e1), Just e1' <- step e1 = Just (If e1' e2 e3)
step (If TRUE e2 e3) = Just e2
step (If FALSE e2 e3) = Just e3
-- END ...
step _ = Nothing
