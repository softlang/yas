module Language.BIPL.Analysis.DeadCode.Domain where

import Data.Map (Map)
import qualified Data.Map as Map
import Language.BIPL.Syntax

data IntInfo
  = AnyInt
  | ConstInt Int
  deriving (Eq, Ord, Show)

data BoolInfo
  = AnyBool
  | ConstBool Bool
  deriving (Eq, Ord, Show)

data AbstractValue
  = AbsInt IntInfo
  | AbsBool BoolInfo
  | AbsUnknown
  deriving (Eq, Ord, Show)

-- | Expression property computed by the algebra.
--
-- The abstract value is used to decide whether a guard is definitely true,
-- definitely false, or unknown. The expression is reconstructed so diagnostics
-- can point back to the actual guard.
data Property = Property
  { abstractValue :: AbstractValue
  , propertyExpr :: Expr
  }
  deriving (Eq, Ord, Show)

type VarEnv = Map String AbstractValue

data Diagnostic
  = UnreachableThen Expr
  | UnreachableElse Expr
  | UnreachableLoopBody Expr
  deriving (Eq, Ord, Show)

data AnalysisState = AnalysisState
  { facts :: VarEnv
  , diagnostics :: [Diagnostic]
  }
  deriving (Eq, Show)

data AnalysisResult = AnalysisResult
  { finalFacts :: VarEnv
  , findings :: [Diagnostic]
  }
  deriving (Eq, Show)

unknownProperty :: Expr -> Property
unknownProperty = Property AbsUnknown

joinStates :: AnalysisState -> AnalysisState -> AnalysisState -> AnalysisState
joinStates base left right = AnalysisState
  { facts = joinFacts (facts left) (facts right)
  , diagnostics = diagnostics base ++ newDiagnostics left ++ newDiagnostics right
  }
  where
    inherited = length (diagnostics base)
    newDiagnostics st = drop inherited (diagnostics st)

joinFacts :: VarEnv -> VarEnv -> VarEnv
joinFacts m1 m2 =
  Map.fromList
    [ (x, joinMaybe (Map.lookup x m1) (Map.lookup x m2))
    | x <- Map.keys (Map.union m1 m2)
    ]

joinMaybe :: Maybe AbstractValue -> Maybe AbstractValue -> AbstractValue
joinMaybe Nothing Nothing = AbsUnknown
joinMaybe (Just v) Nothing = joinValue v AbsUnknown
joinMaybe Nothing (Just v) = joinValue AbsUnknown v
joinMaybe (Just v1) (Just v2) = joinValue v1 v2

joinValue :: AbstractValue -> AbstractValue -> AbstractValue
joinValue (AbsInt (ConstInt x)) (AbsInt (ConstInt y))
  | x == y = AbsInt (ConstInt x)
joinValue (AbsInt _) (AbsInt _) = AbsInt AnyInt
joinValue (AbsBool (ConstBool x)) (AbsBool (ConstBool y))
  | x == y = AbsBool (ConstBool x)
joinValue (AbsBool _) (AbsBool _) = AbsBool AnyBool
joinValue x y
  | x == y = x
  | otherwise = AbsUnknown

asBool :: Property -> Maybe Bool
asBool (Property (AbsBool (ConstBool b)) _) = Just b
asBool _ = Nothing

boolProperty :: Expr -> Maybe Bool -> Property
boolProperty e (Just b) = Property (AbsBool (ConstBool b)) e
boolProperty e Nothing = Property (AbsBool AnyBool) e

intProperty :: Expr -> Maybe Int -> Property
intProperty e (Just i) = Property (AbsInt (ConstInt i)) e
intProperty e Nothing = Property (AbsInt AnyInt) e

knownInt :: Property -> Maybe Int
knownInt (Property (AbsInt (ConstInt i)) _) = Just i
knownInt _ = Nothing

knownBool :: Property -> Maybe Bool
knownBool (Property (AbsBool (ConstBool b)) _) = Just b
knownBool _ = Nothing
