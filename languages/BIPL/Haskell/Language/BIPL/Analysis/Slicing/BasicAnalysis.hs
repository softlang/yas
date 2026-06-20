module Language.BIPL.Analysis.Slicing.BasicAnalysis
  ( analyze
  , analyzeWithPc
  , exprDependencies
  , assignedVariables
  ) where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.Slicing.Domain

import qualified Data.Map as Map
import qualified Data.Set as Set

-- | Analyze a statement starting with no control dependencies.
analyze :: Stmt -> Env -> AnalysisResult
analyze stmt env = AnalysisResult (analyzeStmt Set.empty stmt env)

-- | Analyze a statement under an explicit program-counter dependency set.
analyzeWithPc :: Dependencies -> Stmt -> Env -> AnalysisResult
analyzeWithPc pc stmt env = AnalysisResult (analyzeStmt pc stmt env)

analyzeStmt :: Dependencies -> Stmt -> Env -> Env
analyzeStmt _ Skip env = env
analyzeStmt pc (Assign x e) env =
  Map.insert x (Set.union pc (exprDependencies env e)) env
analyzeStmt pc (Seq s1 s2) env =
  let env' = analyzeStmt pc s1 env
   in analyzeStmt pc s2 env'
analyzeStmt pc (If guard thenStmt elseStmt) env =
  let guardDeps = exprDependencies env guard
      branchPc = Set.union pc guardDeps
      thenEnv = analyzeStmt branchPc thenStmt env
      elseEnv = analyzeStmt branchPc elseStmt env
   in joinEnv thenEnv elseEnv
analyzeStmt pc (While guard body) env =
  let guardDeps = exprDependencies env guard
      loopPc = Set.union pc guardDeps
      invariant = fixEnv 50 (loopStep loopPc body) env
      -- A loop may execute zero times, so the post-state joins the entry state
      -- with the invariant obtained by executing the body abstractly.
      post = joinEnv env invariant
      -- Variables modified by the body are control-dependent on the guard even
      -- when the body is not precise enough to expose that dependency by itself.
      modified = assignedVariables body
   in foldr (addGuardDependency guardDeps) post modified
loopStep :: Dependencies -> Stmt -> Env -> Env
loopStep pc body env = joinEnv env (analyzeStmt pc body env)

fixEnv :: Int -> (Env -> Env) -> Env -> Env
fixEnv 0 _ env = env
fixEnv n f env =
  let env' = f env
   in if env' == env then env else fixEnv (n - 1) f env'

addGuardDependency :: Dependencies -> String -> Env -> Env
addGuardDependency guardDeps x env =
  Map.insert x (Set.union guardDeps (lookupDeps x env)) env

-- | Dependencies of an expression in the current abstract environment.
-- Constants have no dependencies. Unknown variables are treated as inputs.
exprDependencies :: Env -> Expr -> Dependencies
exprDependencies _ (IntConst _) = Set.empty
exprDependencies env (Var x) = lookupDeps x env
exprDependencies env (Unary _ e) = exprDependencies env e
exprDependencies env (Binary _ e1 e2) =
  Set.union (exprDependencies env e1) (exprDependencies env e2)

-- | Variables assigned anywhere in a statement.
assignedVariables :: Stmt -> [String]
assignedVariables Skip = []
assignedVariables (Assign x _) = [x]
assignedVariables (Seq s1 s2) = assignedVariables s1 ++ assignedVariables s2
assignedVariables (If _ s1 s2) = assignedVariables s1 ++ assignedVariables s2
assignedVariables (While _ body) = assignedVariables body
