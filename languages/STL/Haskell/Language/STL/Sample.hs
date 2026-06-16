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

-- | filter odd
odds :: STL
odds =
  Filter Odd

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
dropThenFilter :: STL
dropThenFilter =
  Seq
    (Drop 2)
    (Filter (GreaterThan 3))

-- | Fan-out example:
--
-- The same input is processed in two branches.
--
-- Left branch:  even numbers doubled.
-- Right branch: odd numbers squared.
splitEvenOdd :: STL
splitEvenOdd =
  Par
    doubleEvens
    squareOdds

-- | First projection from a parallel computation.
leftOfSplit :: STL
leftOfSplit =
  Fst splitEvenOdd

-- | Second projection from a parallel computation.
rightOfSplit :: STL
rightOfSplit =
  Snd splitEvenOdd

-- | Fan-in example:
--
-- Merge the two independently computed streams by interleaving them.
mergeEvenOdd :: STL
mergeEvenOdd =
  Merge
    doubleEvens
    squareOdds

