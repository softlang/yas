-- BEGIN ...
-- Evaluation of terms
module Language.BTL.Interpreter where

import Language.BTL.Syntax
import Language.BTL.Value
-- END ...
evaluate :: Expr -> Value
evaluate TRUE = Right True
evaluate FALSE = Right False
evaluate Zero = Left 0
evaluate (Succ e) = Left (n+1) where Left n = evaluate e
evaluate (Pred e) = Left (n - if n==0 then 0 else 1) where Left n = evaluate e
evaluate (IsZero e) = Right (n==0) where Left n = evaluate e
evaluate (If e0 e1 e2) = evaluate (if b then e1 else e2) where Right b = evaluate e0 
