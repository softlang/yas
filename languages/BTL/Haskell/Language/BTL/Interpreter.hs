-- BEGIN ...
module Language.BTL.Interpreter where

import Language.BTL.Syntax
import Language.BTL.Domains
-- END ...
-- Evaluation of terms
evaluate :: Expr -> Value
evaluate TRUE = Right True
evaluate FALSE = Right False
evaluate Zero = Left 0
evaluate (Succ e) = Left (i+1) where Left i = evaluate e
evaluate (Pred e) = Left (i - if i==0 then 0 else 1) where Left i = evaluate e
evaluate (IsZero e) = Right (i==0) where Left i = evaluate e
evaluate (If e0 e1 e2) = evaluate (if b then e1 else e2) where Right b = evaluate e0 
