-- BEGIN ...
module Language.BIPL.Sign.Sample where

import Language.BIPL.Syntax
import Data.Perhaps
import Data.Perhaps.Map
import Data.Perhaps.Sign
import Language.BIPL.Sign.Domains (AStore)

-- END ...
factorialV1 :: Stmt
factorialV1
  = Seq
      (Seq (Assign "y" (IntConst 1))
                (Assign "i" (IntConst 1)))
      (While
        (Binary Leq (Var "i") (Var "x"))
        (Seq
          (Assign "y" (Binary Mul (Var "y") (Var "i")))
          (Assign "i" (Binary Add (Var "i") (IntConst 1)))))

factorialV2 :: Stmt
factorialV2
  = Seq
      (Assign "y" (IntConst 1))
      (While
        (Binary Geq (Var "x") (IntConst 1))
        (Seq
          (Assign "y" (Binary Mul (Var "y") (Var "x")))
          (Assign "x" (Binary Sub (Var "x") (IntConst 1)))))

store :: AStore
store = insert' "x" (Between (Left (Between Pos))) Bottom
