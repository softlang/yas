module Language.BIPL.Analysis.InformationFlow.BasicAnalysis
  ( analyze
  , analyzeWithPublicSinks
  , algebra
  , initialState
  , finish
  , exprSec
  , module Language.BIPL.Analysis.InformationFlow.Domain
  ) where

import Data.List (nub)
import Language.BIPL.Algebra.Signature
import qualified Language.BIPL.Algebra.Scheme as Algebra
import Language.BIPL.Syntax
import Language.BIPL.Analysis.InformationFlow.Domain

type Store = AnalysisState

-- | Analyze a BIPL statement with an initial security environment and no
-- explicitly declared public sinks. This is useful if callers only want the
-- final abstract environment and high-control diagnostics.
analyze :: Stmt -> Env -> AnalysisResult
analyze stmt env =
  analyzeWithPublicSinks stmt env []

-- | Analyze a BIPL statement with an initial security environment and a list of
-- public sinks that should remain Low.
--
-- Kept as a convenience wrapper; the implementation is now algebraic.
analyzeWithPublicSinks :: Stmt -> Env -> PublicSinks -> AnalysisResult
analyzeWithPublicSinks stmt env sinks =
  finish (Algebra.interpret algebra stmt (initialState env sinks))

-- | Information-flow / taint analysis as a BIPL algebra.
--
-- Expressions compute their security level and reconstruct their syntax for
-- diagnostics. Statements update the security environment, thread a program
-- counter security level, and collect diagnostics.
algebra :: Alg Store Property
algebra = Alg
  { skip' = id

  , assign' = \x e st ->
      let p = e st
          eSec = propertySec p
          xSec = joinSec (statePc st) eSec
          env' = assignSec x xSec (stateEnv st)
          explicit =
            [ ExplicitFlowToPublic x eSec (propertyExpr p)
            | x `elem` stateSinks st
            , eSec == High
            ]
          implicit =
            [ ImplicitFlowToPublic x (statePc st) (propertyExpr p)
            | x `elem` stateSinks st
            , statePc st == High
            ]
      in st
           { stateEnv = env'
           , stateDiagnostics =
               nubDiagnostics (stateDiagnostics st ++ explicit ++ implicit)
           }

  , seq' = \f g st -> g (f st)

  , if' = \guard thenS elseS st ->
      let p = guard st
          guardSec = propertySec p
          oldPc = statePc st
          pc' = joinSec oldPc guardSec
          highGuard = [HighControl (propertyExpr p) | guardSec == High]

          thenState = thenS (st { statePc = pc' })
          elseState = elseS (st { statePc = pc' })

      in st
           { stateEnv = joinEnv (stateEnv thenState) (stateEnv elseState)
           , statePc = oldPc
           , stateDiagnostics =
               nubDiagnostics
                 ( stateDiagnostics st
                   ++ highGuard
                   ++ newDiagnostics st thenState
                   ++ newDiagnostics st elseState
                 )
           }

  , while' = \guard body st ->
      let p = guard st
          guardSec = propertySec p
          oldPc = statePc st
          pc' = joinSec oldPc guardSec
          highGuard = [HighControl (propertyExpr p) | guardSec == High]

          loopState = loopFix 0 body (st { statePc = pc' })

      in st
           { stateEnv = stateEnv loopState
           , statePc = oldPc
           , stateDiagnostics =
               nubDiagnostics
                 ( stateDiagnostics st
                   ++ highGuard
                   ++ newDiagnostics st loopState
                 )
           }

  , intconst' = \i _ ->
      Property Low (IntConst i)

  , var' = \x st ->
      Property (lookupSec x (stateEnv st)) (Var x)

  , unary' = \op e st ->
      let p = e st
      in Property (propertySec p) (Unary op (propertyExpr p))

  , binary' = \op e1 e2 st ->
      let p1 = e1 st
          p2 = e2 st
      in Property
           (joinSec (propertySec p1) (propertySec p2))
           (Binary op (propertyExpr p1) (propertyExpr p2))
  }

-- | Fixed-point iteration for loops.
--
-- The security lattice is finite, so this normally reaches a fixed point
-- quickly. The counter is a conservative guard against accidental
-- non-convergence if the analysis is extended later.
loopFix :: Int -> (Store -> Store) -> Store -> Store
loopFix n body current
  | n > 20 = current
  | otherwise =
      let bodyState = body current
          nextEnv = joinEnv (stateEnv current) (stateEnv bodyState)
          next = bodyState { stateEnv = nextEnv }
      in if stateEnv next == stateEnv current
           then next
           else loopFix (n + 1) body next

newDiagnostics :: Store -> Store -> [Diagnostic]
newDiagnostics before after =
  drop (length (stateDiagnostics before)) (stateDiagnostics after)

-- | Abstract confidentiality of an expression.
--
-- This helper is retained for callers/tests that want expression-level
-- analysis without going through a full statement.
exprSec :: Env -> Expr -> Sec
exprSec _ (IntConst _) = Low
exprSec env (Var x) = lookupSec x env
exprSec env (Unary _ e) = exprSec env e
exprSec env (Binary _ e1 e2) =
  joinSec (exprSec env e1) (exprSec env e2)

initialState :: Env -> PublicSinks -> AnalysisState
initialState env sinks = AnalysisState
  { stateEnv = env
  , stateSinks = sinks
  , statePc = Low
  , stateDiagnostics = []
  }

finish :: AnalysisState -> AnalysisResult
finish st =
  AnalysisResult
    (stateEnv st)
    (nubDiagnostics (stateDiagnostics st ++ finalLeaks))
  where
    finalLeaks =
      [ FinalPublicLeak v s
      | v <- stateSinks st
      , let s = lookupSec v (stateEnv st)
      , s == High
      ]

