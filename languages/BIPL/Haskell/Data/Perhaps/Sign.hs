-- BEGIN ...
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
-- Signs as abstract numbers
module Data.Perhaps.Sign where

import Data.Perhaps
import Data.Perhaps.Utilities
import Data.Perhaps.Bool

-- END ...
-- Signs
type Sign' = Perhaps Sign
data Sign = Zero | Pos | Neg
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Signs as numbers
instance Num Sign'
 where
  -- ...
-- BEGIN ...
  signum = id
  abs Top = Top
  abs Bottom = Bottom
  abs (Between Zero) = Between Zero
  abs (Between Pos) = Between Pos
  abs (Between Neg) = Between Pos

  fromInteger n | n  > 0    = Between Pos
                | n  < 0    = Between Neg
                | otherwise = Between Zero
-- END ...
  Top + _ = Top
  _ + Top = Top
  Bottom + _ = Bottom
  _ + Bottom = Bottom
  (Between s1) + (Between s2)
    = case (s1, s2) of
        (Zero, Zero) -> Between Zero
        (Zero, Pos) -> Between Pos
        (Zero, Neg) -> Between Neg
        (Pos, Zero) -> Between Pos
        (Pos, Pos) -> Between Pos
        (Pos, Neg) -> Top
        (Neg, Zero) -> Between Neg
        (Neg, Pos) -> Top
        (Neg, Neg) -> Between Neg
-- ...
-- BEGIN ...
  Top - _ = Top
  _ - Top = Top
  Bottom - _ = Bottom
  _ - Bottom = Bottom
  (Between s1) - (Between s2)
    = case (s1, s2) of
        (Zero, Zero) -> Between Zero
        (Zero, Pos) -> Between Neg
        (Zero, Neg) -> Between Pos
        (Pos, Zero) -> Between Pos
        (Pos, Pos) -> Top
        (Pos, Neg) -> Between Pos
        (Neg, Zero) -> Between Neg
        (Neg, Pos) -> Between Neg
        (Neg, Neg) -> Top

  Top * _ = Top
  _ * Top = Top
  (Between Zero) * _ = Between Zero
  _ * (Between Zero) = Between Zero
  (Between Pos) * (Between Pos) = Between Pos
  (Between Neg) * (Between Neg) = Between Pos
  (Between Pos) * (Between Neg) = Between Neg
  (Between Neg) * (Between Pos) = Between Neg
  Bottom * _ = Bottom
  _ * Bottom = Bottom

-- Abstraction-based greater-equal on signs
geqSign :: Sign' -> Sign' -> Bool'
geqSign (Between Zero) (Between Zero) = Between True
geqSign (Between Zero) (Between Neg) = Between True
geqSign (Between Pos) (Between Zero) = Between True
geqSign (Between Pos) (Between Pos) = Top
geqSign (Between Pos) (Between Neg) = Between True
geqSign (Between Neg) (Between Neg) = Top
geqSign Top _ = Top
geqSign _ Top = Top
geqSign Bottom _ = Bottom
geqSign _ Bottom = Bottom
geqSign _ _ = Between False

-- Abstraction-based equality on signs
eqSign :: Sign' -> Sign' -> Bool'
eqSign Top _ = Top
eqSign _ Top = Top
eqSign Bottom _ = Bottom
eqSign _ Bottom = Bottom
eqSign (Between Pos) (Between Pos) = Top
eqSign (Between Neg) (Between Neg) = Top
eqSign (Between Zero) (Between Zero) = Between True
eqSign _ _ = Between False

-- Abstraction-based less-equal on signs
leqSign :: Sign' -> Sign' -> Bool'
leqSign Top _ = Top
leqSign _ Top = Top
leqSign Bottom _ = Bottom
leqSign _ Bottom = Bottom
leqSign (Between Pos) (Between Pos) = Top
leqSign (Between Neg) (Between Neg) = Top
leqSign (Between Pos) (Between Zero) = Between False
leqSign (Between Pos) (Between Neg) = Between False
leqSign (Between Zero) (Between Neg) = Between False
leqSign _ _ = Between True
-- END ...

-- Partial order for signs
instance POrd Sign where
  pord = mkPord (==)
  lub = lubFlat
