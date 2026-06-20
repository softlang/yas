module Language.BIPL.Analysis.Termination.BasicAnalysis where

import Language.BIPL.Syntax
import Language.BIPL.Analysis.Termination.Domain

-- | Analyze all syntactic while loops in a statement.
--
--   This is intentionally a "termination-ish" analysis: it recognizes common
--   counter-loop variants of the form
--
--     while x < c  do x := x + k
--     while x <= c do x := x + k
--     while x > c  do x := x - k
--     while x >= c do x := x - k
--
--   for positive k. It reports suspicious loops when the guard variable is not
--   updated or is moved away from the bound, and otherwise reports unknown.
analyze :: Stmt -> AnalysisResult
analyze = AnalysisResult . analyzeStmt

analyzeStmt :: Stmt -> [Finding]
analyzeStmt Skip = []
analyzeStmt (Assign _ _) = []
analyzeStmt (Seq s1 s2) = analyzeStmt s1 ++ analyzeStmt s2
analyzeStmt (If _ s1 s2) = analyzeStmt s1 ++ analyzeStmt s2
analyzeStmt (While e body) = classifyLoop e body : analyzeStmt body

classifyLoop :: Expr -> Stmt -> Finding
classifyLoop e body =
  Finding e $
    case guardBound e of
      Just (UpperBound x n) -> classifyDelta x ("upper bound " ++ show n) NeedsIncrease (netDelta x body)
      Just (LowerBound x n) -> classifyDelta x ("lower bound " ++ show n) NeedsDecrease (netDelta x body)
      Nothing -> UnknownVariant "guard is not a recognized variable/bound comparison"

data Need = NeedsIncrease | NeedsDecrease

classifyDelta :: String -> String -> Need -> Delta -> Verdict
classifyDelta x bound need delta =
  case delta of
    KnownDelta k
      | movesToward need k ->
          ProvenVariant x ("body changes " ++ x ++ " by " ++ show k ++ ", moving it toward the " ++ bound)
      | k == 0 ->
          SuspectVariant x ("body leaves " ++ x ++ " unchanged, so the loop variant does not decrease")
      | otherwise ->
          SuspectVariant x ("body changes " ++ x ++ " by " ++ show k ++ ", moving it away from the " ++ bound)
    NoChange ->
      SuspectVariant x ("body does not assign to guard variable " ++ x)
    UnknownDelta ->
      UnknownVariant ("body changes guard variable " ++ x ++ " in a way this analysis cannot classify")

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
guardBound _ = Nothing

-- | Compute the syntactic net change of a variable over a statement.
netDelta :: String -> Stmt -> Delta
netDelta _ Skip = NoChange
netDelta x (Assign y e)
  | x == y = exprDelta x e
  | otherwise = NoChange
netDelta x (Seq s1 s2) = combineDelta (netDelta x s1) (netDelta x s2)
netDelta x (If _ s1 s2) = branchDelta (netDelta x s1) (netDelta x s2)
netDelta _ (While _ _) = UnknownDelta

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
