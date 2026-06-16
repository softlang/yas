module Main where

import Language.REL.Syntax
import Language.REL.Sample
import Language.REL.Interpreter

main :: IO ()
main = do
  putStrLn "REL demo"

  test "a" a
    [ ""
    , "a"
    , "b"
    , "aa"
    ]

  test "ab" ab
    [ ""
    , "a"
    , "b"
    , "ab"
    , "abb"
    ]

  test "a|b" aOrB
    [ ""
    , "a"
    , "b"
    , "ab"
    ]

  test "a*" manyA
    [ ""
    , "a"
    , "aa"
    , "b"
    , "aaa"
    ]

  test "ab*" aThenManyB
    [ ""
    , "a"
    , "ab"
    , "abb"
    , "ba"
    ]

  test "(a|b)*" manyAOrB
    [ ""
    , "a"
    , "b"
    , "ab"
    , "ba"
    , "abba"
    , "abc"
    ]

  test "a(b|a)*" sample
    [ ""
    , "a"
    , "ab"
    , "aa"
    , "aba"
    , "ba"
    ]

test :: String -> REL -> [String] -> IO ()
test name r inputs = do
  putStrLn ""
  putStrLn name
  mapM_ report inputs
 where
  report s =
    putStrLn
      (pad (show s) ++ " -> " ++ show (accepts r s))

pad :: String -> String
pad s =
  take 10 (s ++ repeat ' ')

