module Language.BIPL.Analysis.Interval.Domain where

import Data.CPO
import Data.Map (Map)
import qualified Data.Map as Map
import Data.List (nub)

-- | Bounds for integer intervals.
data Bound
  = NegInf
  | Finite Int
  | PosInf
  deriving (Eq, Show)

-- | Closed integer intervals with explicit bottom.
data Interval
  = BottomInterval
  | Interval Bound Bound
  deriving (Eq, Show)

-- | Boolean facts for conditions computed from intervals.
data AbsBool
  = BottomBool
  | KnownBool Bool
  | TopBool
  deriving (Eq, Show)

-- | Abstract BIPL values: integer intervals or abstract booleans.
data AbsValue
  = BottomValue
  | IntValue Interval
  | BoolValue AbsBool
  | TopValue
  deriving (Eq, Show)

-- | Abstract variable environment.
--
-- Missing bindings are interpreted as BottomValue for joins and partial-order
-- checks. Expression lookup deliberately uses TopValue instead; see lookupVar.
newtype Env = Env { getEnv :: Map String AbsValue }
  deriving (Eq)

instance Show Env where
  show (Env m) = show (Map.toList m)

instance CPO Bound where
  pord = leBound
  lub = maxUpper

instance CPO Interval where
  pord BottomInterval _ = True
  pord _ BottomInterval = False
  pord (Interval l1 u1) (Interval l2 u2) =
    leBound l2 l1 && leBound u1 u2

  lub BottomInterval y = y
  lub x BottomInterval = x
  lub (Interval l1 u1) (Interval l2 u2) =
    Interval (minLower l1 l2) (maxUpper u1 u2)

instance Bottom Interval where
  bottom = BottomInterval

instance CPO AbsBool where
  pord BottomBool _ = True
  pord _ TopBool = True
  pord x y = x == y

  lub BottomBool y = y
  lub x BottomBool = x
  lub x y
    | x == y    = x
    | otherwise = TopBool

instance Bottom AbsBool where
  bottom = BottomBool

instance CPO AbsValue where
  pord BottomValue _ = True
  pord _ TopValue = True
  pord (IntValue x) (IntValue y) = pord x y
  pord (BoolValue x) (BoolValue y) = pord x y
  pord x y = x == y

  lub BottomValue y = y
  lub x BottomValue = x
  lub (IntValue x) (IntValue y) = IntValue (lub x y)
  lub (BoolValue x) (BoolValue y) = BoolValue (lub x y)
  lub x y
    | x == y    = x
    | otherwise = TopValue

instance Bottom AbsValue where
  bottom = BottomValue

instance CPO Env where
  pord (Env x) (Env y) = all leqAt (keys x y)
    where
      leqAt k = pord (lookupJoin k (Env x)) (lookupJoin k (Env y))

  lub (Env x) (Env y) =
    Env $ Map.fromList [ (k, lub (lookupJoin k (Env x)) (lookupJoin k (Env y)))
                       | k <- keys x y ]

instance Bottom Env where
  bottom = emptyEnv

emptyEnv :: Env
emptyEnv = Env Map.empty

fromListEnv :: [(String, AbsValue)] -> Env
fromListEnv = Env . Map.fromList

lookupVar :: String -> Env -> AbsValue
lookupVar x (Env m) = Map.findWithDefault TopValue x m

insertVar :: String -> AbsValue -> Env -> Env
insertVar x v (Env m) = Env (Map.insert x v m)

lookupJoin :: String -> Env -> AbsValue
lookupJoin x (Env m) = Map.findWithDefault BottomValue x m

keys :: Map String AbsValue -> Map String AbsValue -> [String]
keys x y = nub (Map.keys x ++ Map.keys y)

singleton :: Int -> Interval
singleton i = Interval (Finite i) (Finite i)

topInterval :: Interval
topInterval = Interval NegInf PosInf

isZeroInterval :: Interval -> Bool
isZeroInterval (Interval (Finite 0) (Finite 0)) = True
isZeroInterval _ = False

leBound :: Bound -> Bound -> Bool
leBound NegInf _ = True
leBound _ PosInf = True
-- leBound PosInf PosInf = True
leBound PosInf _ = False
leBound _ NegInf = False
leBound (Finite x) (Finite y) = x <= y

ltBound :: Bound -> Bound -> Bool
ltBound x y = leBound x y && x /= y

minLower :: Bound -> Bound -> Bound
minLower x y
  | leBound x y = x
  | otherwise   = y

maxUpper :: Bound -> Bound -> Bound
maxUpper x y
  | leBound x y = y
  | otherwise   = x

negBound :: Bound -> Bound
negBound NegInf = PosInf
negBound PosInf = NegInf
negBound (Finite x) = Finite (negate x)

addBound :: Bound -> Bound -> Bound
addBound (Finite x) (Finite y) = Finite (x + y)
addBound NegInf PosInf = NegInf
addBound PosInf NegInf = PosInf
addBound NegInf _ = NegInf
addBound _ NegInf = NegInf
addBound PosInf _ = PosInf
addBound _ PosInf = PosInf

subBound :: Bound -> Bound -> Bound
subBound x y = addBound x (negBound y)

negInterval :: Interval -> Interval
negInterval BottomInterval = BottomInterval
negInterval (Interval l u) = Interval (negBound u) (negBound l)

addInterval :: Interval -> Interval -> Interval
addInterval BottomInterval _ = BottomInterval
addInterval _ BottomInterval = BottomInterval
addInterval (Interval l1 u1) (Interval l2 u2) =
  Interval (addBound l1 l2) (addBound u1 u2)

subInterval :: Interval -> Interval -> Interval
subInterval BottomInterval _ = BottomInterval
subInterval _ BottomInterval = BottomInterval
subInterval (Interval l1 u1) (Interval l2 u2) =
  Interval (subBound l1 u2) (subBound u1 l2)

mulInterval :: Interval -> Interval -> Interval
mulInterval BottomInterval _ = BottomInterval
mulInterval _ BottomInterval = BottomInterval
mulInterval x y
  | isZeroInterval x || isZeroInterval y = singleton 0
mulInterval (Interval (Finite l1) (Finite u1)) (Interval (Finite l2) (Finite u2)) =
  let products = [l1 * l2, l1 * u2, u1 * l2, u1 * u2]
   in Interval (Finite (minimum products)) (Finite (maximum products))
mulInterval _ _ = topInterval

ltInterval :: Interval -> Interval -> AbsBool
ltInterval BottomInterval _ = BottomBool
ltInterval _ BottomInterval = BottomBool
ltInterval (Interval l1 u1) (Interval l2 u2)
  | ltBound u1 l2 = KnownBool True
  | not (ltBound l1 u2) = KnownBool False
  | otherwise = TopBool

leqInterval :: Interval -> Interval -> AbsBool
leqInterval BottomInterval _ = BottomBool
leqInterval _ BottomInterval = BottomBool
leqInterval (Interval l1 u1) (Interval l2 u2)
  | leBound u1 l2 = KnownBool True
  | ltBound u2 l1 = KnownBool False
  | otherwise = TopBool

eqInterval :: Interval -> Interval -> AbsBool
eqInterval BottomInterval _ = BottomBool
eqInterval _ BottomInterval = BottomBool
eqInterval x y
  | x == y && singletonInterval x = KnownBool True
  | disjoint x y = KnownBool False
  | otherwise = TopBool

singletonInterval :: Interval -> Bool
singletonInterval (Interval l u) = l == u
singletonInterval _ = False

disjoint :: Interval -> Interval -> Bool
disjoint (Interval _ u1) (Interval l2 _) | ltBound u1 l2 = True
disjoint (Interval _ u2) (Interval l1 _) | ltBound u2 l1 = True
disjoint _ _ = False

notBool :: AbsBool -> AbsBool
notBool BottomBool = BottomBool
notBool TopBool = TopBool
notBool (KnownBool b) = KnownBool (not b)

andBool :: AbsBool -> AbsBool -> AbsBool
andBool BottomBool _ = BottomBool
andBool _ BottomBool = BottomBool
andBool (KnownBool False) _ = KnownBool False
andBool _ (KnownBool False) = KnownBool False
andBool (KnownBool True) b = b
andBool b (KnownBool True) = b
andBool TopBool TopBool = TopBool

orBool :: AbsBool -> AbsBool -> AbsBool
orBool BottomBool _ = BottomBool
orBool _ BottomBool = BottomBool
orBool (KnownBool True) _ = KnownBool True
orBool _ (KnownBool True) = KnownBool True
orBool (KnownBool False) b = b
orBool b (KnownBool False) = b
orBool TopBool TopBool = TopBool

widenInterval :: Interval -> Interval -> Interval
widenInterval BottomInterval y = y
widenInterval x BottomInterval = x
widenInterval (Interval l1 u1) (Interval l2 u2) =
  Interval l' u'
  where
    l' = if ltBound l2 l1 then NegInf else l1
    u' = if ltBound u1 u2 then PosInf else u1

widenValue :: AbsValue -> AbsValue -> AbsValue
widenValue BottomValue y = y
widenValue x BottomValue = x
widenValue (IntValue x) (IntValue y) = IntValue (widenInterval x y)
widenValue (BoolValue x) (BoolValue y) = BoolValue (lub x y)
widenValue x y
  | x == y    = x
  | otherwise = TopValue

widenEnv :: Env -> Env -> Env
widenEnv (Env x) (Env y) =
  Env $ Map.fromList [ (k, widenValue (lookupJoin k (Env x)) (lookupJoin k (Env y)))
                     | k <- keys x y ]
