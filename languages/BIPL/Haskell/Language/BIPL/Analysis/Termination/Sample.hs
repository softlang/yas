module Language.BIPL.Analysis.Termination.Sample where

import Language.BIPL.Syntax

-- | Recognized as terminating: x moves down toward the lower bound 1.
decrementToZero :: Stmt
decrementToZero =
  Seq
    (Assign "x" (IntConst 10))
    (While
      (Binary Geq (Var "x") (IntConst 1))
      (Assign "x" (Binary Sub (Var "x") (IntConst 1))))

-- | Recognized as terminating: i moves up toward the upper bound 10.
incrementToLimit :: Stmt
incrementToLimit =
  Seq
    (Assign "i" (IntConst 0))
    (While
      (Binary Lt (Var "i") (IntConst 10))
      (Assign "i" (Binary Add (Var "i") (IntConst 1))))

-- | Suspicious: the guard says x should decrease, but the body increases x.
movesAwayFromBound :: Stmt
movesAwayFromBound =
  While
    (Binary Gt (Var "x") (IntConst 0))
    (Assign "x" (Binary Add (Var "x") (IntConst 1)))

-- | Suspicious: the guard variable is never updated.
guardVariableUnchanged :: Stmt
guardVariableUnchanged =
  While
    (Binary Gt (Var "x") (IntConst 0))
    (Assign "y" (Binary Add (Var "y") (IntConst 1)))

-- | Unknown: the guard is Boolean rather than a recognized variable/bound
-- comparison.
unknownBooleanGuard :: Stmt
unknownBooleanGuard =
  While
    (Var "b")
    (Assign "x" (Binary Sub (Var "x") (IntConst 1)))

-- | Unknown: an if statement changes x inconsistently across branches.
unknownConditionalUpdate :: Stmt
unknownConditionalUpdate =
  While
    (Binary Lt (Var "x") (IntConst 10))
    (If
      (Var "b")
      (Assign "x" (Binary Add (Var "x") (IntConst 1)))
      (Assign "x" (Binary Add (Var "x") (IntConst 2))))
