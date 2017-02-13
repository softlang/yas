-- BEGIN ...
module Language.BFPL.Samples.Factorial where

import Language.BFPL.Syntax
-- END ...
-- factorial :: Int -> Int
-- factorial x = if ((==) x 0) then 1 else ((*) x (factorial ((-) x 1)))
-- main = print $ factorial 5
factorial :: Program
factorial = ([(
  "factorial",
  (([IntType], IntType),
   (["x"],
     If (Binary Eq (Arg "x") (IntConst 0))
        (IntConst 1)
        (Binary Mul
            (Arg "x")
            (Apply "factorial" [Binary Sub (Arg "x") (IntConst 1)])))))],
  (Apply "factorial" [IntConst 5]))
