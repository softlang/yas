-- BEGIN ...
-- Abstract maps with abstract values
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
module Data.Perhaps.Map where

import Prelude hiding (lookup)
import Data.Map (Map, toList, empty, (!))
import qualified Data.Map
import Data.Perhaps
import Data.Perhaps.Utilities

-- END ...
type Map' k v = Perhaps (Map k v)

-- Partial order for maps
instance (Ord k, POrd v)  => POrd (Map k (Perhaps v)) where

  pord = mkPord (\x y -> and (map (f y) (toList x)))
    where f y (k,v) = case Data.Map.lookup k y of
                         Nothing -> isBottom v
                         (Just v') -> pord v v'

  lub = mkLub (\x y -> Between (foldr f y (toList x)))
    where f (k,v) m = Data.Map.insert k v' m
            where v' = case Data.Map.lookup k m of
                          Nothing -> v
                          (Just v'') -> lub v v''

-- Lifted insert operation
insert :: Ord k => k -> v -> Map' k v -> Map' k v
-- ...
-- BEGIN ...
insert k v Bottom = Between (Data.Map.insert k v empty)
insert k v (Between m) = Between (Data.Map.insert k v m)
insert k v Top = Top
-- END ...

-- Lifted lookup operation
lookup :: Ord k => Map' k (Perhaps v) -> k -> (Perhaps v)
-- ...
-- BEGIN ...
lookup Bottom _ = Bottom
lookup (Between m) k = m!k
lookup Top _ = Top
-- END ...
-- Lifted keys operation
keys :: Map' k v -> [k]
-- BEGIN ...
keys Bottom = []
keys (Between m) = Data.Map.keys m
-- END ...
