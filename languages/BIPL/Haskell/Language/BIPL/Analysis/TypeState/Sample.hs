module Language.BIPL.Analysis.TypeState.Sample where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.TypeState.Domain

-- x : Int, y : Int
sameTypeOk :: Stmt
sameTypeOk =
  Seq
    (Assign "x" (IntConst 1))
    (Assign "y" (Binary Add (Var "x") (IntConst 2)))

sameTypeOkStore :: TypeEnv
sameTypeOkStore = emptyEnv

-- x first becomes Int and then is assigned a Bool-valued expression.
-- The analysis records this as TypeError for x.
reassignmentError :: Stmt
reassignmentError =
  Seq
    (Assign "x" (IntConst 1))
    (Assign "x" (Binary Geq (Var "x") (IntConst 0)))

reassignmentErrorStore :: TypeEnv
reassignmentErrorStore = emptyEnv

-- The two branches assign different types to y.
branchError :: Stmt
branchError =
  If
    (Binary Geq (Var "x") (IntConst 0))
    (Assign "y" (IntConst 1))
    (Assign "y" (Binary Geq (Var "x") (IntConst 0)))

branchErrorStore :: TypeEnv
branchErrorStore = fromListEnv [("x", IntType)]

-- The guard is Int-typed, not Bool-typed.
guardError :: Stmt
guardError =
  If
    (Var "x")
    (Assign "y" (IntConst 1))
    (Assign "y" (IntConst 2))

guardErrorStore :: TypeEnv
guardErrorStore = fromListEnv [("x", IntType)]

-- A loop that preserves the type state of x.
loopOk :: Stmt
loopOk =
  While
    (Binary Geq (Var "x") (IntConst 0))
    (Assign "x" (Binary Sub (Var "x") (IntConst 1)))

loopOkStore :: TypeEnv
loopOkStore = fromListEnv [("x", IntType)]
