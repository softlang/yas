-- BEGIN ...
module Language.BNL.Acceptor where
import Control.Monad
-- END ...
-- Accept and enforce complete input consumption 
accept :: String -> Bool
accept ts = case number ts of
  Just [] -> True
  _ -> False

-- Functions for nonterminals
number, bits, bit, rest :: String -> Maybe String

-- [number] number : bits rest ;
number ts = bits ts >>= rest 

-- [single] bits : bit ;
-- [many] bits : bit bits ;
bits ts = many `mplus` single
  where
    single = bit ts
    many = bit ts >>= bits

-- [zero] bit : '0' ;
-- [one] bit : '1' ; 
bit ts = zero `mplus` one
  where
    zero = match '0' ts
    one = match '1' ts

-- [integer] rest : ;
-- [rational] rest : '.' bits ;
rest ts = rational `mplus` integer
  where
    integer = Just ts
    rational = match '.' ts >>= bits

-- Match a terminal (a character)
match :: Char -> String -> Maybe String
match t (t':ts) | t == t' = Just ts
match _ _ = Nothing
