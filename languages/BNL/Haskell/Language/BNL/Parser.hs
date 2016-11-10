-- BEGIN ...
module Language.BNL.Parser where
import Language.BNL.Syntax
import Control.Monad

-- The parser type constructor
type Parser a = String -> Maybe (a, String)
-- END ...
-- Parse and enforce complete input consumption 
parse :: String -> Maybe Number
parse i = case number i of
  Just (n, []) -> Just n
  _ -> Nothing

-- [number] number : bits rest ;
number :: Parser Number
number i = do
  (bs, i') <- bits i
  (r, i'') <- rest i'
  Just (Number bs r, i'')

-- [single] bits : bit ;
-- [many] bits : bit bits ;
bits i = many `mplus` single
  where
    single = do (b, i') <- bit i; Just (Single b, i')
    many = do (b, i') <- bit i; (bs, i'') <- bits i'; Just (Many b bs, i'')

-- [zero] bit : '0' ;
-- [one] bit : '1' ; 
bit i = zero `mplus` one
  where
    zero = do i' <- match '0' i; Just (Zero, i') 
    one = do i' <- match '1' i; Just (One, i')

-- [integer] rest : ;
-- [rational] rest : '.' bits ;
rest i = rational `mplus` integer
  where
    integer = Just (Integer, i) 
    rational = do
      i' <- match '.' i
      (bs, i'') <- bits i'
      Just (Rational bs, i'') 
-- BEGIN ...
-- Match a terminal (a character)
match :: Char -> String -> Maybe String
match t (t':i) | t == t' = Just i
match _ _ = Nothing
-- END ...
