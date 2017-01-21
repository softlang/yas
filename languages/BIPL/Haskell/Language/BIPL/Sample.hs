-- BEGIN ...
module Language.BIPL.Sample where

import Language.BIPL.Syntax
-- END ...
-- x = 14; y = 4; // Divide x by y
-- q = 0; r = x; // Compute quotient q and remainder r
-- while (r >= y) { r = r - y; q = q + 1; }
euclideanDivision :: Stmt
euclideanDivision =
   Seq (Assign "x" (IntConst 14)) (Seq (Assign "y" (IntConst 4))
  (Seq (Assign "q" (IntConst 0)) (Seq (Assign "r" (Var "x"))
       (While
         (Binary Geq (Var "r") (Var "y"))
         (Seq (Assign "r" (Binary Sub (Var "r") (Var "y")))
              (Assign "q" (Binary Add (Var "q") (IntConst 1))))))))
