module Language.BIPL.Analysis.DeadCode.Sample where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.DeadCode.Domain
import Data.Map (fromList)

-- | The else branch is unreachable because x is known to be positive.
deadElse :: Stmt
deadElse =
  Seq
    (Assign "x" (IntConst 1))
    (If
      (Binary Gt (Var "x") (IntConst 0))
      (Assign "y" (IntConst 1))
      (Assign "y" (IntConst 2)))

deadElseStore :: Env
deadElseStore = fromList []

-- | The then branch is unreachable because x is known to be zero.
deadThen :: Stmt
deadThen =
  Seq
    (Assign "x" (IntConst 0))
    (If
      (Binary Lt (Var "x") (IntConst 0))
      (Assign "y" (IntConst 1))
      (Assign "y" (IntConst 2)))

deadThenStore :: Env
deadThenStore = fromList []

-- | Neither branch is reported as unreachable because b is unknown.
unknownBranch :: Stmt
unknownBranch =
  If
    (Var "b")
    (Assign "x" (IntConst 1))
    (Assign "x" (IntConst 2))

unknownBranchStore :: Env
unknownBranchStore = fromList [("b", ValBool BoolTop)]

-- | The loop body is unreachable because the guard is definitely false.
deadLoopBody :: Stmt
deadLoopBody =
  Seq
    (Assign "x" (IntConst 0))
    (While
      (Binary Lt (Var "x") (IntConst 0))
      (Assign "x" (Binary Add (Var "x") (IntConst 1))))

deadLoopBodyStore :: Env
deadLoopBodyStore = fromList []

-- | A nested example: the inner else branch is unreachable inside the loop.
nestedDeadBranch :: Stmt
nestedDeadBranch =
  Seq
    (Assign "x" (IntConst 1))
    (While
      (Binary Gt (Var "x") (IntConst 0))
      (Seq
        (If
          (Binary Eq (Var "x") (IntConst 1))
          (Assign "y" (IntConst 1))
          (Assign "y" (IntConst 2)))
        (Assign "x" (Binary Sub (Var "x") (IntConst 1)))))

nestedDeadBranchStore :: Env
nestedDeadBranchStore = fromList []
