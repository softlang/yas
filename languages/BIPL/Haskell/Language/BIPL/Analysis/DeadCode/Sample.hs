module Language.BIPL.Analysis.DeadCode.Sample where

import Data.Map (fromList)
import Language.BIPL.Syntax
import Language.BIPL.Analysis.DeadCode.Domain

deadElse :: Stmt
deadElse =
  Seq
    (Assign "x" (IntConst 1))
    (If
      (Binary Gt (Var "x") (IntConst 0))
      (Assign "y" (IntConst 1))
      (Assign "y" (IntConst 2)))

deadElseStore :: VarEnv
deadElseStore = fromList []

deadThen :: Stmt
deadThen =
  Seq
    (Assign "x" (IntConst 1))
    (If
      (Binary Lt (Var "x") (IntConst 0))
      (Assign "y" (IntConst 1))
      (Assign "y" (IntConst 2)))

deadThenStore :: VarEnv
deadThenStore = fromList []

unknownBranch :: Stmt
unknownBranch =
  If
    (Var "b")
    (Assign "x" (IntConst 1))
    (Assign "x" (IntConst 2))

unknownBranchStore :: VarEnv
unknownBranchStore =
  fromList [("b", AbsBool AnyBool)]

deadLoopBody :: Stmt
deadLoopBody =
  While
    (Binary Eq (IntConst 0) (IntConst 1))
    (Assign "x" (IntConst 1))

deadLoopBodyStore :: VarEnv
deadLoopBodyStore = fromList []

nestedDeadBranch :: Stmt
nestedDeadBranch =
  If
    (Var "b")
    (If
      (Binary Eq (IntConst 1) (IntConst 1))
      (Assign "x" (IntConst 1))
      (Assign "x" (IntConst 2)))
    (Assign "x" (IntConst 3))

nestedDeadBranchStore :: VarEnv
nestedDeadBranchStore =
  fromList [("b", AbsBool AnyBool)]
