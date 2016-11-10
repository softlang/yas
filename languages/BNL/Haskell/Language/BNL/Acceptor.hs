-- BEGIN ...
module Language.BNL.Acceptor where
import Control.Monad
-- END ...
-- Accept and enforce complete input consumption 
accept :: String -> Bool
accept i = case number i of
  Just [] -> True
  _ -> False

-- Functions for nonterminals
number, bits, bit, rest :: String -> Maybe String

-- [number] number : bits rest ;
number i = bits i >>= rest 

-- [single] bits : bit ;
-- [many] bits : bit bits ;
bits i = many `mplus` single
  where
    single = bit i
    many = bit i >>= bits

-- [zero] bit : '0' ;
-- [one] bit : '1' ; 
bit i = zero `mplus` one
  where
    zero = match '0' i
    one = match '1' i

-- [integer] rest : ;
-- [rational] rest : '.' bits ;
rest i = rational `mplus` integer
  where
    integer = Just i
    rational = match '.' i >>= bits

-- Match a terminal (a character)
match :: Char -> String -> Maybe String
match t (t':i) | t == t' = Just i
match _ _ = Nothing
