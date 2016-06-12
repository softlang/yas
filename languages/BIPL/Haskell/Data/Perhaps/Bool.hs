-- BEGIN ...
module Data.Perhaps.Bool where

import Data.Perhaps
import Data.Perhaps.Utilities

-- END ...
-- Partially ordered booleans
type Bool' = Perhaps Bool

-- Abstraction for standard Booleans
fromBool :: Bool -> Bool'
fromBool = Between

-- Negation
not' :: Bool' -> Bool'
not' Top = Top
not' Bottom = Bottom
not' (Between b) = Between (not b)

-- Conjunction
and' :: Bool' -> Bool' -> Bool'
-- ...
-- BEGIN ...
and' Top _ = Top
and' _ Top = Top
and' Bottom _ = Bottom
and' _ Bottom = Bottom
and' (Between b1) (Between b2) = Between (b1 && b2)
-- END ...

-- Partial order for booleans
instance POrd Bool where
  pord = mkPord (==)
  lub = lubFlat
