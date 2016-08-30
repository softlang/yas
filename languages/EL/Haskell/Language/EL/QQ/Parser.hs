-- BEGIN ...
module Language.EL.QQ.Parser(expr) where
import Language.EL.QQ.Syntax
import Language.EL.QQ.Lexer
import Text.Parsec
import Text.Parsec.String (Parser)

expr :: Parser Expr
expr = do
  e1 <- bexpr
  e2 <- optionMaybe (op "||" >> expr)
  return $ maybe e1 (Binary Or e1) e2

bexpr :: Parser Expr
bexpr = do
  e1 <- cexpr
  e2 <- optionMaybe (op "&&" >> bexpr)
  return $ maybe e1 (Binary And e1) e2

cexpr :: Parser Expr
cexpr = do
  e1 <- aexpr
  ope2 <- optionMaybe ((,) <$> ops <*> aexpr)
  return $ maybe e1 (\(op, e2) -> Binary op e1 e2) ope2
 where
  ops =  (op "<" >> return Lt)
     <|> (op "<=" >> return Le)
     <|> (op "==" >> return Eq)
     <|> (op ">=" >> return Geq)
     <|> (op ">" >> return Gt)

aexpr :: Parser Expr
aexpr = do
  e1 <- term
  ope2 <- optionMaybe ((,) <$> ops <*> aexpr)
  return $ maybe e1 (\(op, e2) -> Binary op e1 e2) ope2
 where
  ops =  (op "+" >> return Add)
     <|> (op "-" >> return Sub)

term :: Parser Expr
term = do
  e1 <- factor
  e2 <- optionMaybe (op "*" >> term)
  return $ maybe e1 (Binary Mul e1) e2
-- END ...
factor :: Parser Expr
factor
  = -- ... -- The same syntax as before
-- BEGIN ...
      (IntConst <$> int)
  <|> (Var <$> identifier)
  <|> (parens expr)
  <|> (Unary Negate <$> (op "-" >> factor))
  <|> (Unary Not <$> (op "!" >> factor))
-- END ...
  <|> (MetaVar <$> (op "$" >> identifier)) -- An additional choice in parsing
