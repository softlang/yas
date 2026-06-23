module Language.BIPL.Analysis.Slicing.BasicAnalysis
  ( analyze
  , analyzeWithPc
  , algebra
  , initialState
  , finish
  , exprDependencies
  , assignedVariables
  , module Language.BIPL.Analysis.Slicing.Domain
  ) where

import qualified Data.Map as Map
import qualified Data.Set as Set
import Language.BIPL.Algebra.Signature
import qualified Language.BIPL.Algebra.Scheme as Algebra
import Language.BIPL.Syntax
import Language.BIPL.Analysis.Slicing.Domain

type Store = AnalysisState
type Property = Dependencies

-- | Analyze a statement starting with no control dependencies.
--
-- Kept as a convenience wrapper; the implementation is now algebraic.
analyze :: Stmt -> Env -> AnalysisResult
analyze stmt env =
  finish (Algebra.interpret algebra stmt (initialState env))

-- | Analyze a statement under an explicit program-counter dependency set.
analyzeWithPc :: Dependencies -> Stmt -> Env -> AnalysisResult
analyzeWithPc pc stmt env =
  finish (Algebra.interpret algebra stmt (AnalysisState env pc))

-- | Dependency / slicing analysis as a BIPL algebra.
--
-- Expressions compute dependency sets. Statements update a dependency
-- environment and thread the current program-counter dependency set through
-- branches and loops.
algebra :: Alg Store Property
algebra = Alg
  { skip' = id

  , assign' = \x e st ->
      let deps = Set.union (statePc st) (e st)
      in st { stateEnv = Map.insert x deps (stateEnv st) }

  , seq' = \f g st -> g (f st)

  , if' = \guard thenS elseS st ->
      let guardDeps = guard st
          oldPc = statePc st
          branchPc = Set.union oldPc guardDeps

          thenState = thenS (st { statePc = branchPc })
          elseState = elseS (st { statePc = branchPc })

      in st
           { stateEnv = joinEnv (stateEnv thenState) (stateEnv elseState)
           , statePc = oldPc
           }

  , while' = \guard body st ->
      let guardDeps = guard st
          oldPc = statePc st
          loopPc = Set.union oldPc guardDeps
          entryEnv = stateEnv st

          invariant = fixEnv 50 (loopStep loopPc body) entryEnv

          -- A loop may execute zero times, so the post-state joins the entry
          -- state with the invariant obtained by executing the body abstractly.
          post = joinEnv entryEnv invariant

          -- Variables modified by the body are control-dependent on the guard
          -- even when the body is not precise enough to expose that dependency
          -- by itself.
          modified = assignedVariables body

      in st
           { stateEnv = foldr (addGuardDependency guardDeps) post modified
           , statePc = oldPc
           }

  , intconst' = \_ _ -> Set.empty

  , var' = \x st ->
      lookupDeps x (stateEnv st)

  , unary' = \_ e st ->
      e st

  , binary' = \_ e1 e2 st ->
      Set.union (e1 st) (e2 st)
  }

loopStep :: Dependencies -> (Store -> Store) -> Env -> Env
loopStep pc body env =
  let st = AnalysisState env pc
      bodyEnv = stateEnv (body st)
  in joinEnv env bodyEnv

fixEnv :: Int -> (Env -> Env) -> Env -> Env
fixEnv 0 _ env = env
fixEnv n f env =
  let env' = f env
  in if env' == env
       then env
       else fixEnv (n - 1) f env'

addGuardDependency :: Dependencies -> String -> Env -> Env
addGuardDependency guardDeps x env =
  Map.insert x (Set.union guardDeps (lookupDeps x env)) env

-- | Dependencies of an expression in the current abstract environment.
--
-- This helper is retained for callers/tests that want expression-level
-- analysis without going through a full statement.
exprDependencies :: Env -> Expr -> Dependencies
exprDependencies env e =
  case e of
    IntConst _ -> Set.empty
    Var x -> lookupDeps x env
    Unary _ e1 -> exprDependencies env e1
    Binary _ e1 e2 -> Set.union (exprDependencies env e1) (exprDependencies env e2)

-- | Variables assigned anywhere in a statement.
--
-- This is computed by using the statement algebra in a special environment:
-- every assignment records the assigned variable as its own dependency. This
-- avoids a separate direct recursive traversal for the main analysis.
assignedVariables :: (Store -> Store) -> [String]
assignedVariables body =
  Map.keys (stateEnv (body (AnalysisState Map.empty Set.empty)))

initialState :: Env -> AnalysisState
initialState env = AnalysisState
  { stateEnv = env
  , statePc = Set.empty
  }

finish :: AnalysisState -> AnalysisResult
finish = AnalysisResult . stateEnv

