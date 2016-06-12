-- BEGIN ...
module Language.BFPL.Samples.Exp where

import Language.BFPL.Syntax
import Prelude hiding (exp)
-- END ...
-- The representation of the exponentation function
exp :: Function
exp = (
  "exp",
  (([Int, Int], Int),
   (["x", "n"],
     If (Binary Eq (Arg "n") (IntConst 0))
        (IntConst 1)
        (Binary Mul
            (Arg "x")
            (Apply "exp" [Arg "x", Binary Sub (Arg "n") (IntConst 1)])))))
