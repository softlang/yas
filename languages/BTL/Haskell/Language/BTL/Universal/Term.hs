-- BEGIN ...
module Language.BTL.Universal.Term where
import Language.BTL.Syntax
import Data.TermRep
import Data.Term
-- END ...
instance Term Expr where
  explode TRUE = TermRep "TRUE" []
  explode FALSE = TermRep "FALSE" []
  explode Zero = TermRep "Zero" []
  explode (Succ e) = TermRep "Succ" [explode e]
  -- ...
-- BEGIN ...
  explode (Pred e) = TermRep "Pred" [explode e]
  explode (IsZero e) = TermRep "IsZero" [explode e]
  explode (If e0 e1 e2) = TermRep "If" (map explode [e0, e1, e2])
-- END ...
  implode (TermRep "TRUE" []) = TRUE
  implode (TermRep "FALSE" []) = FALSE
  implode (TermRep "Zero" []) = Zero
  implode (TermRep "Succ" [t]) = Succ (implode t)
  -- ...
-- BEGIN ...
  implode (TermRep "Pred" [t]) = Pred (implode t)
  implode (TermRep "IsZero" [t]) = IsZero (implode t)
  implode (TermRep "If" [t0, t1, t2]) = If e0 e1 e2
    where
      e0 = implode t0
      e1 = implode t1
      e2 = implode t2
-- END ...
