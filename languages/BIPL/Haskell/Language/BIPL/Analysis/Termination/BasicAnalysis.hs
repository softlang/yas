module Language.BIPL.Analysis.Termination.BasicAnalysis where

import Language.BIPL.Algebra.Signature
import qualified Language.BIPL.Algebra.Scheme as Algebra
import Language.BIPL.Syntax
import Language.BIPL.Analysis.Termination.Domain

type Property = Expr
type Store = AnalysisState

-- | Analyze all syntactic while loops in a statement.
--
-- This convenience function now delegates traversal to the generic BIPL
-- algebraic interpretation scheme. Use 'algebra', 'initialState', and 'finish'
-- directly when you want to see the analysis as an algebra instance.
analyze :: Stmt -> AnalysisResult
analyze stmt = finish (Algebra.interpret algebra stmt initialState)

-- | Termination-ish analysis as an algebra.
--
-- The expression part reconstructs BIPL expressions. This gives 'while'' the
-- syntactic guard expression it needs for the loop-variant heuristic.
--
-- The statement part has two modes:
--
-- * ordinary analysis mode: collect one finding per while loop, recursively;
-- * tracking mode: summarize how a selected variable changes in a loop body.
algebra :: Alg Store Property
algebra = a
  where
    a = Alg
      { skip' = id

      , assign' = \x f st ->
          case trackedVariable st of
            Nothing -> st
            Just y
              | x == y ->
                  st { trackedDelta =
                         combineDelta (trackedDelta st) (exprDelta y (f st)) }
              | otherwise -> st

      , seq' = flip (.)

      , if' = \_ g h st ->
          case trackedVariable st of
            Nothing ->
              -- For this structural analysis, both branches may contain loops
              -- that should be reported. We therefore traverse both branches.
              h (g st)
            Just _ ->
              let before = trackedDelta st
                  gDelta = trackedDelta (g (st { trackedDelta = NoChange }))
                  hDelta = trackedDelta (h (st { trackedDelta = NoChange }))
              in st { trackedDelta = combineDelta before (branchDelta gDelta hDelta) }

      , while' = \f body st ->
          case trackedVariable st of
            Nothing ->
              -- Report this loop and then traverse the body once to find
              -- syntactically nested loops. This is not concrete execution.
              body (addFinding (classifyLoop (f st) body) st)
            Just _ ->
              -- A nested loop inside a loop body makes the selected variable's
              -- net syntactic delta unknown, matching the previous direct
              -- syntax traversal.
              st { trackedDelta = UnknownDelta }

      , intconst' = \i _ -> IntConst i
      , var' = \x _ -> Var x
      , unary' = \o f st -> Unary o (f st)
      , binary' = \o f g st -> Binary o (f st) (g st)
      }

classifyLoop :: Expr -> (Store -> Store) -> Finding
classifyLoop e body =
  Finding e $
    case guardBound e of
      Just (UpperBound x n) ->
        classifyDelta x ("upper bound " ++ show n) NeedsIncrease
          (netDeltaByAlgebra x body)
      Just (LowerBound x n) ->
        classifyDelta x ("lower bound " ++ show n) NeedsDecrease
          (netDeltaByAlgebra x body)
      Nothing ->
        UnknownVariant "guard is not a recognized variable/bound comparison"

netDeltaByAlgebra :: String -> (Store -> Store) -> Delta
netDeltaByAlgebra x body =
  trackedDelta (body (trackingState x))

data Need
  = NeedsIncrease
  | NeedsDecrease

classifyDelta :: String -> String -> Need -> Delta -> Verdict
classifyDelta x bound need delta =
  case delta of
    KnownDelta k
      | movesToward need k ->
          ProvenVariant x
            ("body changes " ++ x ++ " by " ++ show k
              ++ ", moving it toward the " ++ bound)
      | k == 0 ->
          SuspectVariant x
            ("body leaves " ++ x
              ++ " unchanged, so the loop variant does not decrease")
      | otherwise ->
          SuspectVariant x
            ("body changes " ++ x ++ " by " ++ show k
              ++ ", moving it away from the " ++ bound)
    NoChange ->
      SuspectVariant x
        ("body does not assign to guard variable " ++ x)
    UnknownDelta ->
      UnknownVariant
        ("body changes guard variable " ++ x
          ++ " in a way this analysis cannot classify")

movesToward :: Need -> Int -> Bool
movesToward NeedsIncrease k = k > 0
movesToward NeedsDecrease k = k < 0

-- | Recognize guards that give a loop variable an integer upper/lower bound.
guardBound :: Expr -> Maybe GuardBound
guardBound (Binary Lt  (Var x)      (IntConst n)) = Just (UpperBound x n)
guardBound (Binary Leq (Var x)      (IntConst n)) = Just (UpperBound x n)
guardBound (Binary Gt  (Var x)      (IntConst n)) = Just (LowerBound x n)
guardBound (Binary Geq (Var x)      (IntConst n)) = Just (LowerBound x n)
guardBound (Binary Gt  (IntConst n) (Var x))      = Just (UpperBound x n)
guardBound (Binary Geq (IntConst n) (Var x))      = Just (UpperBound x n)
guardBound (Binary Lt  (IntConst n) (Var x))      = Just (LowerBound x n)
guardBound (Binary Leq (IntConst n) (Var x))      = Just (LowerBound x n)
guardBound _                                      = Nothing

combineDelta :: Delta -> Delta -> Delta
combineDelta UnknownDelta _ = UnknownDelta
combineDelta _ UnknownDelta = UnknownDelta
combineDelta NoChange d = d
combineDelta d NoChange = d
combineDelta (KnownDelta x) (KnownDelta y) = KnownDelta (x + y)

branchDelta :: Delta -> Delta -> Delta
branchDelta d1 d2
  | d1 == d2 = d1
  | otherwise = UnknownDelta

-- | Recognize assignments x := x + k, x := k + x, x := x - k, and x := x.
exprDelta :: String -> Expr -> Delta
exprDelta x (Var y)
  | x == y = KnownDelta 0
  | otherwise = UnknownDelta
exprDelta x (Binary Add (Var y) (IntConst k))
  | x == y = KnownDelta k
  | otherwise = UnknownDelta
exprDelta x (Binary Add (IntConst k) (Var y))
  | x == y = KnownDelta k
  | otherwise = UnknownDelta
exprDelta x (Binary Sub (Var y) (IntConst k))
  | x == y = KnownDelta (-k)
  | otherwise = UnknownDelta
exprDelta _ _ = UnknownDelta

initialState :: AnalysisState
initialState = AnalysisState
  { stateFindings = []
  , trackedVariable = Nothing
  , trackedDelta = NoChange
  }

trackingState :: String -> AnalysisState
trackingState x = AnalysisState
  { stateFindings = []
  , trackedVariable = Just x
  , trackedDelta = NoChange
  }

finish :: AnalysisState -> AnalysisResult
finish = AnalysisResult . stateFindings

addFinding :: Finding -> AnalysisState -> AnalysisState
addFinding finding st = st { stateFindings = stateFindings st ++ [finding] }
