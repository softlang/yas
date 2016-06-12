-- BEGIN ...
module Language.BFPL.Samples.Factorial where

import Language.BFPL.Syntax
-- END ...
sample :: Program
sample = ([(
  "factorial",
  (([Int], Int),
   (["x"],
     If (Binary Eq (Arg "x") (IntConst 0))
        (IntConst 1)
        (Binary Mul
            (Arg "x")
            (Apply "factorial" [Binary Sub (Arg "x") (IntConst 1)])))))],
  (Apply "factorial" [IntConst 5]))
