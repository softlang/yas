module Language.BIPL.Analysis.TypeState.Domain where

import Data.CPO
import Data.Map (Map)
import qualified Data.Map as Map
import Data.List (nub)

-- | Abstract type information for BIPL expressions and variables.
--
-- BottomType represents unreachable / not-yet-observed information.
-- TypeError is the top element and records an inconsistent or ill-typed state.
data TypeState
  = BottomType
  | IntType
  | BoolType
  | TypeError
  deriving (Eq, Show)

instance CPO TypeState where
  pord BottomType _ = True
  pord _ TypeError = True
  pord x y = x == y

  lub BottomType y = y
  lub x BottomType = x
  lub x y | x == y = x
  lub _ _ = TypeError

instance Bottom TypeState where
  bottom = BottomType

-- | Abstract variable environment.
--
-- A newtype is used instead of the generic Map CPO instance because this
-- analysis deliberately joins environments with different domains. Missing
-- variables are interpreted as BottomType for joins and partial-order checks.
newtype TypeEnv = TypeEnv { getTypeEnv :: Map String TypeState }
  deriving (Eq)

instance Show TypeEnv where
  show (TypeEnv m) = show (Map.toList m)

instance CPO TypeEnv where
  pord (TypeEnv x) (TypeEnv y) =
    all leqAt (keys x y)
    where
      leqAt k = pord (lookupType k (TypeEnv x)) (lookupType k (TypeEnv y))

  lub (TypeEnv x) (TypeEnv y) =
    TypeEnv $ Map.fromList [ (k, lub (lookupType k (TypeEnv x)) (lookupType k (TypeEnv y)))
                           | k <- keys x y ]

instance Bottom TypeEnv where
  bottom = emptyEnv

emptyEnv :: TypeEnv
emptyEnv = TypeEnv Map.empty

fromListEnv :: [(String, TypeState)] -> TypeEnv
fromListEnv = TypeEnv . Map.fromList

lookupType :: String -> TypeEnv -> TypeState
lookupType x (TypeEnv m) = Map.findWithDefault BottomType x m

insertType :: String -> TypeState -> TypeEnv -> TypeEnv
insertType x ty (TypeEnv m) = TypeEnv (Map.insert x ty' m)
  where
    old = Map.findWithDefault BottomType x m
    ty' = old `lub` ty

markError :: TypeEnv -> TypeEnv
markError = insertType "__type_error__" TypeError

keys :: Map String TypeState -> Map String TypeState -> [String]
keys x y = nub (Map.keys x ++ Map.keys y)
