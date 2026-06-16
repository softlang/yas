module Language.STL.Sample where

import Language.STL.Syntax

-- | map (*2)
doubleAll :: STL
doubleAll =
  Map Double

-- | filter even
evens :: STL
evens =
  Filter Even

-- | filter even >>> map (*2)
doubleEvens :: STL
doubleEvens =
  Seq
    (Filter Even)
    (Map Double)

-- | filter odd >>> map square
squareOdds :: STL
squareOdds =
  Seq
    (Filter Odd)
    (Map Square)

-- | take 5 after doubling all values.
firstFiveDoubled :: STL
firstFiveDoubled =
  Seq
    (Map Double)
    (Take 5)

-- | Drop the first two values, then keep values greater than 3.
dropThenFilterGreaterThan3 :: STL
dropThenFilterGreaterThan3 =
  Seq
    (Drop 2)
    (Filter (GreaterThan 3))

-- The same input is processed in two branches.
--
-- Left branch:  even numbers doubled.
-- Right branch: odd numbers squared.
splitEvenOdd :: Binary -> STL
splitEvenOdd b =
  Par
    b
    doubleEvens
    squareOdds

-- | Fan-out examples:
--
-- | First projection from a parallel computation.
leftOfSplit :: STL
leftOfSplit =
  splitEvenOdd Fst

-- | Second projection from a parallel computation.
rightOfSplit :: STL
rightOfSplit =
  splitEvenOdd Snd

-- | Fan-in example:
--
-- Merge the two independently computed streams by interleaving them.
mergeEvenOdd :: STL
mergeEvenOdd =
  splitEvenOdd Interleave
