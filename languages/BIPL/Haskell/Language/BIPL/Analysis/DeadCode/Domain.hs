module Language.BIPL.Analysis.DeadCode.Domain where

import Language.BIPL.Syntax (Expr)
import Data.Map (Map)
import qualified Data.Map as Map

-- | Integer facts used by the dead-branch analysis.
--   The domain is intentionally small: constants are tracked when known;
--   disagreement joins to IntTop.
data AbsInt
  = IntBot
  | IntKnown Int
  | IntTop
  deriving (Eq, Show)

-- | Boolean facts used to decide whether branches are reachable.
data AbsBool
  = BoolBot
  | BoolKnown Bool
  | BoolTop
  deriving (Eq, Show)

-- | Abstract values for BIPL variables and expressions.
data AbsValue
  = ValBot
  | ValInt AbsInt
  | ValBool AbsBool
  | ValTop
  deriving (Eq, Show)

-- | Abstract store.
type Env = Map String AbsValue

-- | Diagnostics reported by the dead-code analysis.
data Diagnostic
  = UnreachableThen Expr
  | UnreachableElse Expr
  | UnreachableLoopBody Expr
  deriving (Eq, Show)

-- | Result of analyzing a statement from a given abstract environment.
data AnalysisResult = AnalysisResult
  { environment :: Env
  , diagnostics :: [Diagnostic]
  } deriving (Eq, Show)

bottomEnv :: Env
bottomEnv = Map.empty

joinInt :: AbsInt -> AbsInt -> AbsInt
joinInt IntBot x = x
joinInt x IntBot = x
joinInt (IntKnown x) (IntKnown y)
  | x == y    = IntKnown x
  | otherwise = IntTop
joinInt _ _ = IntTop

joinBool :: AbsBool -> AbsBool -> AbsBool
joinBool BoolBot x = x
joinBool x BoolBot = x
joinBool (BoolKnown x) (BoolKnown y)
  | x == y    = BoolKnown x
  | otherwise = BoolTop
joinBool _ _ = BoolTop

joinValue :: AbsValue -> AbsValue -> AbsValue
joinValue ValBot x = x
joinValue x ValBot = x
joinValue (ValInt x) (ValInt y) = ValInt (joinInt x y)
joinValue (ValBool x) (ValBool y) = ValBool (joinBool x y)
joinValue x y
  | x == y    = x
  | otherwise = ValTop

joinEnv :: Env -> Env -> Env
joinEnv = Map.unionWith joinValue
