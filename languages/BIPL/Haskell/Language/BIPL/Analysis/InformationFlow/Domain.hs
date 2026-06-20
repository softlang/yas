module Language.BIPL.Analysis.InformationFlow.Domain where

import Data.List (intercalate, nub)
import Data.Map (Map)
import qualified Data.Map as Map
import Language.BIPL.Syntax

-- | A tiny two-point confidentiality lattice.
--
-- Low  <= High
--
-- Low values may flow to public sinks.  High values represent secret/tainted
-- data and must not flow to public sinks.
data Sec = Low | High
  deriving (Eq, Ord)

instance Show Sec where
  show Low = "Low"
  show High = "High"

-- | Abstract variable environment.
type Env = Map String Sec

-- | Variables that are intended to remain public/low.
type PublicSinks = [String]

-- | Diagnostics reported by the information-flow analysis.
data Diagnostic
  = ExplicitFlowToPublic String Sec Expr
    -- ^ A public sink was assigned an expression whose abstract level is High.
  | ImplicitFlowToPublic String Sec Expr
    -- ^ A public sink was assigned under a High program-counter level.
  | HighControl Expr
    -- ^ A branch/loop guard depends on High data.  This is not necessarily a
    -- leak by itself, but assignments in the guarded command are control-tainted.
  | FinalPublicLeak String Sec
    -- ^ A public sink is High in the final abstract environment.
  deriving (Eq, Ord)

instance Show Diagnostic where
  show (ExplicitFlowToPublic v s e) =
    "explicit flow to public sink " ++ show v ++
    ": expression " ++ show e ++ " has level " ++ show s
  show (ImplicitFlowToPublic v s e) =
    "implicit flow to public sink " ++ show v ++
    ": program counter from guard " ++ show e ++ " has level " ++ show s
  show (HighControl e) =
    "high control dependency from guard " ++ show e
  show (FinalPublicLeak v s) =
    "final public sink " ++ show v ++ " has level " ++ show s

-- | Analysis result: final abstract environment plus diagnostics.
data AnalysisResult = AnalysisResult
  { finalEnv :: Env
  , diagnostics :: [Diagnostic]
  } deriving (Eq)

instance Show AnalysisResult where
  show (AnalysisResult env ds) =
    "AnalysisResult { finalEnv = " ++ showEnv env ++
    ", diagnostics = " ++ show ds ++ " }"

showEnv :: Env -> String
showEnv env =
  "fromList [" ++ intercalate ", " [show k ++ " -> " ++ show v | (k, v) <- Map.toList env] ++ "]"

joinSec :: Sec -> Sec -> Sec
joinSec Low Low = Low
joinSec _ _ = High

joins :: [Sec] -> Sec
joins = foldr joinSec Low

joinEnv :: Env -> Env -> Env
joinEnv = Map.unionWith joinSec

lookupSec :: String -> Env -> Sec
lookupSec = Map.findWithDefault Low

assignSec :: String -> Sec -> Env -> Env
assignSec = Map.insert

nubDiagnostics :: [Diagnostic] -> [Diagnostic]
nubDiagnostics = nub
