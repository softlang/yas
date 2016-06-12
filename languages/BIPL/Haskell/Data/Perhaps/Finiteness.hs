-- BEGIN ...
-- Enumeration for finite domains
module Data.Perhaps.Finiteness where

import Data.Perhaps
import Data.Perhaps.Bool
import Data.Perhaps.Sign
import Data.Perhaps.Either
import Data.Perhaps.Map

-- END ...
class Finite a where elems :: [a]
instance Finite Bool where elems = [True, False]
instance Finite Sign where elems = [Zero, Pos, Neg]
instance (Finite x, Finite y) => Finite (Either x y) where
  elems = map Left elems ++ map Right elems
instance Finite a => Finite (Perhaps a) where
  elems = map Between elems

-- Enumerate maps for given keys and finite domains for values
maps :: (Ord k, Finite v) => [k] -> [Map' k v]
maps = foldr f [Bottom]
  where f k ms = concat (map g elems)
          where g v = map (insert' k v) ms
