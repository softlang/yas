-- BEGIN ...
module Language.BIPL.Goto.Sample where
import Language.BIPL.Goto.Syntax
import Language.BIPL.Syntax (Expr(..), UOp(..), BOp(..))
-- END ...
sample :: Stmt
sample =

  -- Sample operands for Euclidian division
   Seq (Assign "x" (IntConst 14))
  (Seq (Assign "y" (IntConst 4))

  -- Compute quotient q=3 and remainder r=2
  (Seq (Assign "q" (IntConst 0))
  (Seq (Assign "r" (Var "x"))
  (Seq (Label "a")
       (If (Binary Geq (Var "r") (Var "y"))
         (Seq (Assign "r" (Binary Sub (Var "r") (Var "y")))
         (Seq (Assign "q" (Binary Add (Var "q") (IntConst 1)))
              (Goto "a")))
         Skip)))))
