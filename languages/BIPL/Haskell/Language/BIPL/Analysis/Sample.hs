-- BEGIN ...
module Language.BIPL.Analysis.Sample where
import Language.BIPL.Syntax
import Data.CPO.Sign
import Data.Map
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

store = insert "x" (Left Pos) empty

-- test1 = While (Binary Geq (Var "x") (IntConst 0)) (Assign "x" (Var "x"))
-- test1 = Assign "x" (Var "x")
test1 = If (Binary Geq (Var "x") (IntConst 0)) (Assign "x" (Var "x")) (Assign "x" (IntConst (-1)))
store1 = insert "x" (Left TopSign) empty
