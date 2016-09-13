-- BEGIN ...
module Language.BNL.Parser where
import Language.BNL.Syntax
import Control.Monad

-- The parser type constructor
type Parser a = String -> Maybe (a, String)
-- END ...
-- Parse and enforce complete input consumption 
parse :: String -> Maybe Number
parse ts = case number ts of
  Just (n, []) -> Just n
  _ -> Nothing

-- [number] number : bits rest ;
number :: Parser Number
number ts = do
  (bs, ts') <- bits ts
  (r, ts'') <- rest ts'
  Just (Number bs r, ts'')

-- [single] bits : bit ;
-- [many] bits : bit bits ;
bits ts = many `mplus` single
  where
    single = do (b, ts') <- bit ts; Just (Single b, ts')
    many = do (b, ts') <- bit ts; (bs, ts'') <- bits ts'; Just (Many b bs, ts'')

-- [zero] bit : '0' ;
-- [one] bit : '1' ; 
bit ts = zero `mplus` one
  where
    zero = do ts' <- match '0' ts; Just (Zero, ts') 
    one = do ts' <- match '1' ts; Just (One, ts')

-- [integer] rest : ;
-- [rational] rest : '.' bits ;
rest ts = rational `mplus` integer
  where
    integer = Just (Integer, ts) 
    rational = do
      ts' <- match '.' ts
      (bs, ts'') <- bits ts'
      Just (Rational bs, ts'') 
-- BEGIN ...
-- Match a terminal (a character)
match :: Char -> String -> Maybe String
match t (t':ts) | t == t' = Just ts
match _ _ = Nothing
-- END ...
