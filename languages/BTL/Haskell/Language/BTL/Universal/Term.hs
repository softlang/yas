-- BEGIN ...
module Language.BTL.Universal.Term where
import Language.BTL.Syntax
import Data.TermRep
import Data.Term
-- END ...
instance Term Expr where
  toTermRep TRUE = TermRep "TRUE" []
  toTermRep FALSE = TermRep "FALSE" []
  toTermRep Zero = TermRep "Zero" []
  toTermRep (Succ e) = TermRep "Succ" [toTermRep e]
  -- ...
-- BEGIN ...
  toTermRep (Pred e) = TermRep "Pred" [toTermRep e]
  toTermRep (IsZero e) = TermRep "IsZero" [toTermRep e]
  toTermRep (If e0 e1 e2) = TermRep "If" (map toTermRep [e0, e1, e2])
-- END ...
  fromTermRep (TermRep "TRUE" []) = TRUE
  fromTermRep (TermRep "FALSE" []) = FALSE
  fromTermRep (TermRep "Zero" []) = Zero
  fromTermRep (TermRep "Succ" [t]) = Succ (fromTermRep t)
  -- ...
-- BEGIN ...
  fromTermRep (TermRep "Pred" [t]) = Pred (fromTermRep t)
  fromTermRep (TermRep "IsZero" [t]) = IsZero (fromTermRep t)
  fromTermRep (TermRep "If" [t0, t1, t2]) = If e0 e1 e2
    where
      e0 = fromTermRep t0
      e1 = fromTermRep t1
      e2 = fromTermRep t2
-- END ...
