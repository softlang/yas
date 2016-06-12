-- BEGIN ...
-- Abstract domains
module Data.Perhaps where

-- END ...
-- Perhapsies, similar to Maybies
data Perhaps a
 = Bottom
 | Between a
 | Top
-- BEGIN ...
 deriving (Eq, Show)
-- END ...

-- Test for forms
isBottom, isBetween, isTop :: Perhaps a -> Bool
isBottom Bottom = True
isBottom _ = False
-- ...
-- BEGIN ...
isBetween (Between _) = True
isBetween _ = False
isTop Top = True
isTop _ = False
-- END ...

-- Partial order and least upper bound for perhapsies
class POrd a where
  pord :: Perhaps a -> Perhaps a -> Bool  
  lub :: Perhaps a -> Perhaps a -> Perhaps a
