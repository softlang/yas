module Main where

import Language.STL.Syntax
import Language.STL.Sample
import Language.STL.Interpreter

main :: IO ()
main = do
  putStrLn "STL demo"

  let input = [-3 .. 8]

  test "doubleAll" doubleAll input
  test "evens" evens input
  test "doubleEvens" doubleEvens input
  test "squareOdds" squareOdds input
  test "firstFiveDoubled" firstFiveDoubled input
  test "dropThenFilterGreaterThan3" dropThenFilterGreaterThan3 input
  test "leftOfSplit" leftOfSplit input
  test "rightOfSplit" rightOfSplit input
  test "mergeEvenOdd" mergeEvenOdd input

test :: String -> STL -> [Int] -> IO ()
test name program input = do
  putStrLn ""
  putStrLn name
  putStrLn ("input  = " ++ show input)
  putStrLn ("output = " ++ show (run program input))

