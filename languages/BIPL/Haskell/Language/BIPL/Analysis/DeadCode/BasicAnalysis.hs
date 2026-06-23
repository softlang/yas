module Language.BIPL.Analysis.DeadCode.BasicAnalysis where

import Data.Map (insert)
import qualified Data.Map as Map
import Language.BIPL.Algebra.Signature
import qualified Language.BIPL.Algebra.Scheme as Algebra
import Language.BIPL.Syntax
import Language.BIPL.Analysis.DeadCode.Domain

type Store = AnalysisState

-- | Analyze unreachable branches and loop bodies.
--
-- The implementation is algebraic: this wrapper is kept for backwards
-- compatibility with earlier examples.
analyze :: Stmt -> VarEnv -> AnalysisResult
analyze stmt env =
  finish (Algebra.interpret algebra stmt (initialState env))

-- | Dead-branch analysis as an algebra.
--
-- Expressions compute a small constant-propagation-like abstract value and
-- reconstruct the expression. Statements update the abstract environment and
-- collect diagnostics. Loops are traversed once for nested diagnostics; this is
-- a static traversal, not concrete loop execution.
algebra :: Alg Store Property
algebra = Alg
  { skip' = id

  , assign' = \x e st ->
      let p = e st
      in st { facts = insert x (abstractValue p) (facts st) }

  , seq' = \f g st -> g (f st)

  , if' = \c t e st ->
      let p = c st
      in case asBool p of
           Just True ->
             t (report (UnreachableElse (propertyExpr p)) st)
           Just False ->
             e (report (UnreachableThen (propertyExpr p)) st)
           Nothing ->
             let left = t st
                 right = e st
             in joinStates st left right

  , while' = \c body st ->
      let p = c st
      in case asBool p of
           Just False ->
             report (UnreachableLoopBody (propertyExpr p)) st
           _ ->
             -- The loop body may contain dead branches. Traverse it once to
             -- collect them, then join its facts with the incoming facts to
             -- account for zero or more iterations.
             let afterBody = body st
             in afterBody { facts = joinFacts (facts st) (facts afterBody) }

  , intconst' = \i _ -> intProperty (IntConst i) (Just i)

  , var' = \x st ->
      Property
        (Map.findWithDefault AbsUnknown x (facts st))
        (Var x)

  , unary' = \op e st ->
      let p = e st
          expr = Unary op (propertyExpr p)
      in case op of
           Negate ->
             intProperty expr (fmap negate (knownInt p))
           Not ->
             boolProperty expr (fmap not (knownBool p))

  , binary' = \op e1 e2 st ->
      let p1 = e1 st
          p2 = e2 st
          expr = Binary op (propertyExpr p1) (propertyExpr p2)
      in evalBinary op expr p1 p2
  }

evalBinary :: BOp -> Expr -> Property -> Property -> Property
evalBinary Add expr p1 p2 =
  intProperty expr ((+) <$> knownInt p1 <*> knownInt p2)
evalBinary Sub expr p1 p2 =
  intProperty expr ((-) <$> knownInt p1 <*> knownInt p2)
evalBinary Mul expr p1 p2 =
  intProperty expr ((*) <$> knownInt p1 <*> knownInt p2)

evalBinary Lt expr p1 p2 =
  boolProperty expr ((<) <$> knownInt p1 <*> knownInt p2)
evalBinary Leq expr p1 p2 =
  boolProperty expr ((<=) <$> knownInt p1 <*> knownInt p2)
evalBinary Geq expr p1 p2 =
  boolProperty expr ((>=) <$> knownInt p1 <*> knownInt p2)
evalBinary Gt expr p1 p2 =
  boolProperty expr ((>) <$> knownInt p1 <*> knownInt p2)

evalBinary Eq expr p1 p2 =
  case (knownInt p1, knownInt p2, knownBool p1, knownBool p2) of
    (Just x, Just y, _, _) -> boolProperty expr (Just (x == y))
    (_, _, Just x, Just y) -> boolProperty expr (Just (x == y))
    _ -> boolProperty expr Nothing

evalBinary And expr p1 p2 =
  boolProperty expr (andBool (knownBool p1) (knownBool p2))
evalBinary Or expr p1 p2 =
  boolProperty expr (orBool (knownBool p1) (knownBool p2))

andBool :: Maybe Bool -> Maybe Bool -> Maybe Bool
andBool (Just False) _ = Just False
andBool _ (Just False) = Just False
andBool (Just True) (Just True) = Just True
andBool _ _ = Nothing

orBool :: Maybe Bool -> Maybe Bool -> Maybe Bool
orBool (Just True) _ = Just True
orBool _ (Just True) = Just True
orBool (Just False) (Just False) = Just False
orBool _ _ = Nothing

initialState :: VarEnv -> AnalysisState
initialState env = AnalysisState
  { facts = env
  , diagnostics = []
  }

finish :: AnalysisState -> AnalysisResult
finish st = AnalysisResult
  { finalFacts = facts st
  , findings = diagnostics st
  }

report :: Diagnostic -> AnalysisState -> AnalysisState
report d st = st { diagnostics = diagnostics st ++ [d] }
