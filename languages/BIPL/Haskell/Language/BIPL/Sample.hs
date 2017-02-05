-- BEGIN ...
module Language.BIPL.Sample where
import Language.BIPL.Syntax
-- END ...
-- // Compute quotient q and remainder r for dividing x by y
-- q = 0; r = x; while (r >= y) { r = r - y; q = q + 1; }
euclideanDiv :: Stmt
euclideanDiv =
  Seq (Assign "q" (IntConst 0)) (Seq (Assign "r" (Var "x"))
      (While
        (Binary Geq (Var "r") (Var "y"))
        (Seq (Assign "r" (Binary Sub (Var "r") (Var "y")))
             (Assign "q" (Binary Add (Var "q") (IntConst 1))))))
-- BEGIN ...
addArguments s = Seq (Assign "x" (IntConst 13)) (Seq (Assign "y" (IntConst 4)) s)
-- END ...
