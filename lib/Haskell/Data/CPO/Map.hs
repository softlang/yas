-- BEGIN ...
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
module Data.CPO.Map where
import Prelude hiding (lookup)
import Data.CPO
import Data.Map (Map, toList, fromList, empty, lookup, insert, (!))
-- END ...
instance (Ord k, CPO v) => CPO (Map k v) where
  pord x y = and (map (f y) (toList x))
    where f y (k,v) = pord v (y!k)
  lub x y = foldr f y (toList x)
    where f (k,v) m = Data.Map.insert k (lub v (y!k)) m
instance (Ord k, CPO v) => Bottom (Map k v) where
  bottom = empty
