module Language.BIPL.Analysis.InformationFlow.BasicAnalysis
  ( analyze
  , analyzeWithPublicSinks
  , exprSec
  , module Language.BIPL.Analysis.InformationFlow.Domain
  ) where

import Data.List (nub)
import qualified Data.Map as Map
import Language.BIPL.Syntax
import Language.BIPL.Analysis.InformationFlow.Domain

-- | Analyze a BIPL statement with an initial security environment and no
-- explicitly declared public sinks.  This is useful if callers only want the
-- final abstract environment and high-control diagnostics.
analyze :: Stmt -> Env -> AnalysisResult
analyze stmt env = analyzeWithPublicSinks stmt env []

-- | Analyze a BIPL statement with an initial security environment and a list of
-- public sinks that should remain Low.
analyzeWithPublicSinks :: Stmt -> Env -> PublicSinks -> AnalysisResult
analyzeWithPublicSinks stmt env sinks =
  let (env', ds) = stmtSec sinks Low env stmt
      finalLeaks = [ FinalPublicLeak v s
                   | v <- sinks
                   , let s = lookupSec v env'
                   , s == High
                   ]
  in AnalysisResult env' (nubDiagnostics (ds ++ finalLeaks))

stmtSec :: PublicSinks -> Sec -> Env -> Stmt -> (Env, [Diagnostic])
stmtSec _ _ env Skip = (env, [])
stmtSec sinks pc env (Assign x e) =
  let eSec = exprSec env e
      xSec = joinSec pc eSec
      env' = assignSec x xSec env
      explicit = [ExplicitFlowToPublic x eSec e | x `elem` sinks, eSec == High]
      implicit = [ImplicitFlowToPublic x pc e | x `elem` sinks, pc == High]
  in (env', explicit ++ implicit)
stmtSec sinks pc env (Seq s1 s2) =
  let (env1, ds1) = stmtSec sinks pc env s1
      (env2, ds2) = stmtSec sinks pc env1 s2
  in (env2, ds1 ++ ds2)
stmtSec sinks pc env (If guard thenS elseS) =
  let guardSec = exprSec env guard
      pc' = joinSec pc guardSec
      highGuard = [HighControl guard | guardSec == High]
      (thenEnv, thenDs) = stmtSec sinks pc' env thenS
      (elseEnv, elseDs) = stmtSec sinks pc' env elseS
  in (joinEnv thenEnv elseEnv, highGuard ++ thenDs ++ elseDs)
stmtSec sinks pc env (While guard body) =
  let guardSec = exprSec env guard
      pc' = joinSec pc guardSec
      highGuard = [HighControl guard | guardSec == High]
      (env', ds) = loopFix 0 sinks pc' guard env []
  in (env', highGuard ++ ds)
  where
    -- The security lattice is finite, so this reaches a fixed point quickly.
    -- The counter is a conservative guard against accidental non-convergence if
    -- the analysis is extended later.
    loopFix :: Int -> PublicSinks -> Sec -> Expr -> Env -> [Diagnostic] -> (Env, [Diagnostic])
    loopFix n ss p g current acc
      | n > 20 = (current, acc)
      | otherwise =
          let (bodyEnv, bodyDs) = stmtSec ss p current body
              next = joinEnv current bodyEnv
          in if next == current
               then (current, acc ++ bodyDs)
               else loopFix (n + 1) ss p g next (acc ++ bodyDs)

-- | Abstract confidentiality of an expression.
exprSec :: Env -> Expr -> Sec
exprSec _ (IntConst _) = Low
exprSec env (Var x) = lookupSec x env
exprSec env (Unary _ e) = exprSec env e
exprSec env (Binary _ e1 e2) = joinSec (exprSec env e1) (exprSec env e2)
