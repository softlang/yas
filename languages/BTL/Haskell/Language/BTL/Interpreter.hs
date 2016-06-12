-- BEGIN ...
module Language.BTL.Interpreter where

import Language.BTL.Syntax
import Language.BTL.Domains
-- END ...
-- Evaluation of terms
evaluate :: Term -> Value
evaluate TRUE = Right True
evaluate FALSE = Right False
evaluate Zero = Left 0
evaluate (Succ t) = Left (i+1) where Left i = evaluate t
evaluate (Pred t) = Left (i - if i==0 then 0 else 1) where Left i = evaluate t
evaluate (IsZero t) = Right (i==0) where Left i = evaluate t  
evaluate (If t0 t1 t2) = evaluate (if b then t1 else t2) where Right b = evaluate t0 
