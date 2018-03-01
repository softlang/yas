-- BEGIN ...
module Language.BNL.LookAheadAcceptor where
import Control.Monad
-- Accept and enforce complete input consumption 
accept :: String -> Bool
accept i = case number i of
  Just [] -> True
  _ -> False

-- Functions for nonterminals
number, bits, bit, rest :: String -> Maybe String

-- [number] number : bits rest ;
number i = bits i >>= rest 
-- END ...
-- [single] bits : bit ;
-- [many] bits : bit bits ;
bits i = if lookahead 2 (flip elem ['0','1']) i
           then many
           else single
  where
    single = bit i
    many = bit i >>= bits

-- [zero] bit : '0' ;
-- [one] bit : '1' ; 
bit i = if lookahead 1 ((==) '0') i
          then zero
          else one
  where
    zero = match '0' i
    one = match '1' i

-- [integer] rest : ;
-- [rational] rest : '.' bits ;
rest i = if lookahead 1 ((==) '.') i then rational else integer
  where
    integer = Just i
    rational = match '.' i >>= bits

-- Look ahead in input; avoid looking beyond end of input
lookahead :: Int -> (Char -> Bool) -> String -> Bool
lookahead l f i = length i >= l && f (i!!(l-1))
-- BEGIN ...
-- Match a terminal (a character)
match :: Char -> String -> Maybe String
match t (t':i) | t == t' = Just i
match _ _ = Nothing
-- END ...
