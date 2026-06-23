module Language.BIPL.Analysis.Slicing.Domain
  ( Dependencies
  , Env
  , AnalysisState(..)
  , AnalysisResult(..)
  , emptyEnv
  , fromListEnv
  , lookupDeps
  , singletonDep
  , unionDeps
  , joinEnv
  ) where

import qualified Data.Map as Map
import Data.Map (Map)
import qualified Data.Set as Set
import Data.Set (Set)

-- | A dependency set records the source variables that may influence a value.
type Dependencies = Set String

-- | A slicing environment maps variables to their dependency sets.
type Env = Map String Dependencies

-- | Internal algebra state.
--
-- The environment is the usual dependency environment. The program-counter
-- dependency set records surrounding control dependencies from if/while guards.
data AnalysisState = AnalysisState
  { stateEnv :: Env
  , statePc :: Dependencies
  }
  deriving (Eq, Show)

-- | Result of the dependency / slicing analysis.
newtype AnalysisResult = AnalysisResult
  { resultEnv :: Env
  }
  deriving (Eq, Show)

emptyEnv :: Env
emptyEnv = Map.empty

fromListEnv :: [(String, [String])] -> Env
fromListEnv =
  Map.fromList . map (\(x, xs) -> (x, Set.fromList xs))

singletonDep :: String -> Dependencies
singletonDep = Set.singleton

unionDeps :: Dependencies -> Dependencies -> Dependencies
unionDeps = Set.union

-- | Reading an unknown variable treats it as an external input dependency.
lookupDeps :: String -> Env -> Dependencies
lookupDeps x env =
  Map.findWithDefault (singletonDep x) x env

-- | Join two abstract environments by unioning dependencies variable-wise.
joinEnv :: Env -> Env -> Env
joinEnv = Map.unionWith Set.union
