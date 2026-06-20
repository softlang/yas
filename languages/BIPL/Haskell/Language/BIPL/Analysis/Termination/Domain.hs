module Language.BIPL.Analysis.Termination.Domain where

import Language.BIPL.Syntax

-- | What kind of numeric bound the loop guard imposes on the loop variable.
--   UpperBound means the loop continues while x is below a bound, so x should
--   increase. LowerBound means the loop continues while x is above a bound, so
--   x should decrease.
data GuardBound
  = UpperBound String Int
  | LowerBound String Int
  deriving (Eq, Show)

-- | Syntactic net change of one variable in a loop body.
data Delta
  = NoChange
  | KnownDelta Int
  | UnknownDelta
  deriving (Eq, Show)

-- | A deliberately lightweight termination verdict.
data Verdict
  = ProvenVariant String String
  | SuspectVariant String String
  | UnknownVariant String
  deriving (Eq, Show)

-- | One finding per syntactic while loop.
data Finding = Finding
  { guardExpression :: Expr
  , verdict :: Verdict
  } deriving (Eq, Show)

newtype AnalysisResult = AnalysisResult
  { findings :: [Finding]
  } deriving (Eq, Show)
