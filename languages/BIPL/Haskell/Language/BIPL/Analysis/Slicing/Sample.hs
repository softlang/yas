module Language.BIPL.Analysis.Slicing.Sample where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.Slicing.Domain

-- | Straight-line data dependencies:
-- x depends on a,b and y depends on a,b,c through x and c.
straightLine :: Stmt
straightLine =
  Seq
    (Assign "x" (Binary Add (Var "a") (Var "b")))
    (Assign "y" (Binary Mul (Var "x") (Var "c")))

straightLineStore :: Env
straightLineStore = emptyEnv

-- | A branch creates a control dependency from c to x.
controlDependency :: Stmt
controlDependency =
  If
    (Var "c")
    (Assign "x" (IntConst 1))
    (Assign "x" (IntConst 2))

controlDependencyStore :: Env
controlDependencyStore = emptyEnv

-- | Both data and control dependencies contribute to z.
combinedDependency :: Stmt
combinedDependency =
  If
    (Binary Gt (Var "limit") (IntConst 0))
    (Assign "z" (Binary Add (Var "x") (Var "y")))
    (Assign "z" (Var "fallback"))

combinedDependencyStore :: Env
combinedDependencyStore = emptyEnv

-- | A loop body assignment is control-dependent on the loop guard and data-
-- dependent on previous values of x and step.
loopDependency :: Stmt
loopDependency =
  While
    (Binary Lt (Var "x") (Var "limit"))
    (Assign "x" (Binary Add (Var "x") (Var "step")))

loopDependencyStore :: Env
loopDependencyStore = emptyEnv

-- | Existing abstract dependencies can be used as a summary for earlier code.
preSeededDependency :: Stmt
preSeededDependency =
  Assign "report" (Binary Add (Var "total") (Var "tax"))

preSeededDependencyStore :: Env
preSeededDependencyStore = fromListEnv
  [ ("total", ["price", "discount"])
  , ("tax", ["region"])
  ]
