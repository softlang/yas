-- BEGIN ...
-- Utilities for abstract domains
module Data.Perhaps.Utilities where

import Data.Perhaps
import Data.Monoid (Monoid,mappend,mempty)

-- END ...
-- Pattern of partial order definition
mkPord :: (a -> a -> Bool) -> Perhaps a -> Perhaps a -> Bool
mkPord _ Bottom _ = True
mkPord _ _ Top = True
mkPord f (Between x) (Between y) = f x y
mkPord _ _ _ = False

-- Pattern of least-upper bound definition
mkLub :: (a -> a -> Perhaps a) -> Perhaps a -> Perhaps a -> Perhaps a
mkLub _ Bottom x = x
mkLub _ x Bottom = x
mkLub _ Top _ = Top
mkLub _ _ Top = Top
mkLub f (Between x) (Between y) = f x y

-- Least-upper bound for flat domains
lubFlat :: Eq a => Perhaps a -> Perhaps a -> Perhaps a
lubFlat = mkLub (\x y -> if x == y then Between x else Top)

-- Perhapsies form a monoid
instance POrd a => Monoid (Perhaps a) where
  mempty = Bottom
  mappend = lub
