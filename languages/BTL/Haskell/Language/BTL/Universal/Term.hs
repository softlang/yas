-- BEGIN ...
module Language.BTL.Universal.Term where
import Language.BTL.Syntax
import Data.TermRep
import Data.Term
-- END ...
instance Term Expr where
  toTermRep TRUE = TermRep "true" []
  toTermRep FALSE = TermRep "false" []
  toTermRep Zero = TermRep "zero" []
  toTermRep (Succ e) = TermRep "succ" [toTermRep e]
  -- ...
-- BEGIN ...
  toTermRep (Pred e) = TermRep "pred" [toTermRep e]
  toTermRep (IsZero e) = TermRep "iszero" [toTermRep e]
  toTermRep (If e0 e1 e2) = TermRep "if" (map toTermRep [e0, e1, e2])
-- END ...
  fromTermRep (TermRep "true" []) = TRUE
  fromTermRep (TermRep "false" []) = FALSE
  fromTermRep (TermRep "zero" []) = Zero
  fromTermRep (TermRep "succ" [t]) = Succ (fromTermRep t)
  -- ...
-- BEGIN ...
  fromTermRep (TermRep "pred" [t]) = Pred (fromTermRep t)
  fromTermRep (TermRep "iszero" [t]) = IsZero (fromTermRep t)
  fromTermRep (TermRep "if" [t0, t1, t2]) = If e0 e1 e2
    where
      e0 = fromTermRep t0
      e1 = fromTermRep t1
      e2 = fromTermRep t2
-- END ...
