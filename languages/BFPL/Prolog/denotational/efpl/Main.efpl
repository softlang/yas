module Main where

import Stdlib
import Sample
import Semantics

showValue :: Option Value -> String
showValue (Some (IntVal x)) = show x
showValue (Some (BoolVal x)) = show x

main = putStrLn (showValue (evalP sample))
