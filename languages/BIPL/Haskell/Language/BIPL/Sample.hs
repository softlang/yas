-- BEGIN ...
module Language.BIPL.Sample where

import Language.BIPL.Syntax
-- END ...
sample :: Stmt
sample =
  -- Sample operands for Euclidian division
   Seq (Assign "x" (IntConst 14))
  (Seq (Assign "y" (IntConst 4))

  -- Compute quotient q=3 and remainder r=2
  (Seq (Assign "q" (IntConst 0))
  (Seq (Assign "r" (Var "x"))
       (While
         (Binary Geq (Var "r") (Var "y"))
         (Seq (Assign "r" (Binary Sub (Var "r") (Var "y")))
                   (Assign "q" (Binary Add (Var "q") (IntConst 1))))))))
