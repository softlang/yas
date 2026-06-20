module Language.BIPL.Analysis.Interval.Sample where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.Interval.Domain

-- | A straight-line arithmetic example. The analysis should infer x=[1,1],
-- y=[3,3], and because y <= 5 is definitely true, z=[3,3].
boundedArithmetic :: Stmt
boundedArithmetic =
  Seq (Assign "x" (IntConst 1))
  (Seq (Assign "y" (Binary Add (Var "x") (IntConst 2)))
       (If (Binary Leq (Var "y") (IntConst 5))
           (Assign "z" (Var "y"))
           (Assign "z" (IntConst 0))))

boundedArithmeticStore :: Env
boundedArithmeticStore = emptyEnv

-- | A counter loop. Widening turns the growing upper bound into +infinity.
counterLoop :: Stmt
counterLoop =
  Seq (Assign "i" (IntConst 0))
      (While (Binary Leq (Var "i") (IntConst 10))
             (Assign "i" (Binary Add (Var "i") (IntConst 1))))

counterLoopStore :: Env
counterLoopStore = emptyEnv

-- | Multiplication over finite intervals.
finiteProduct :: Stmt
finiteProduct =
  Assign "z" (Binary Mul (Var "x") (Var "y"))

finiteProductStore :: Env
finiteProductStore =
  fromListEnv [ ("x", IntValue (Interval (Finite 2) (Finite 4)))
              , ("y", IntValue (Interval (Finite 3) (Finite 5)))
              ]

-- | Unknown branch condition. The result joins both branches, so y=[-1,1].
unknownBranch :: Stmt
unknownBranch =
  If (Var "b")
     (Assign "y" (IntConst 1))
     (Assign "y" (IntConst (-1)))

unknownBranchStore :: Env
unknownBranchStore =
  fromListEnv [("b", BoolValue TopBool)]

-- | An initially ranged variable is widened by the loop body.
rangedLoop :: Stmt
rangedLoop =
  While (Binary Lt (Var "x") (IntConst 100))
        (Assign "x" (Binary Add (Var "x") (IntConst 7)))

rangedLoopStore :: Env
rangedLoopStore =
  fromListEnv [("x", IntValue (Interval (Finite 0) (Finite 20)))]
