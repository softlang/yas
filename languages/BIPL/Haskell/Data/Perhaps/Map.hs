-- BEGIN ...
-- Abstract maps with abstract values
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
module Data.Perhaps.Map where

import Prelude hiding (lookup)
import Data.Map (Map, toList, lookup, insert, empty, (!), keys)
import Data.Perhaps
import Data.Perhaps.Utilities

-- END ...
type Map' k v = Perhaps (Map k v)

-- Partial order for maps
instance (Ord k, POrd v)  => POrd (Map k (Perhaps v)) where

  pord = mkPord (\x y -> and (map (f y) (toList x)))
    where f y (k,v) = maybe (isBottom v) (pord v) (lookup k y)

  lub = mkLub (\x y -> Between (foldr f y (toList x)))
    where f (k,v) m = insert k v' m
            where v' = maybe v (lub v) (lookup k m)

-- Lifted insert operation
insert' :: Ord k => k -> v -> Map' k v -> Map' k v
-- ...
-- BEGIN ...
insert' k v Bottom = Between (insert k v empty)
insert' k v (Between m) = Between (insert k v m)
insert' k v Top = Top
-- END ...

-- Lifted lookup operation
lookup' :: Ord k => Map' k (Perhaps v) -> k -> (Perhaps v)
-- ...
-- BEGIN ...
lookup' Bottom _ = Bottom
lookup' (Between m) k = m!k
lookup' Top _ = Top
-- END ...
-- BEGIN ...
-- Lifted keys operation
keys' :: Map' k v -> [k]
keys' Bottom = []
keys' (Between m) = keys m
-- END ...