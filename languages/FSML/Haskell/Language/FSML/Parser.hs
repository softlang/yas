-- BEGIN ...
--
-- (C) 2016 softlang.org and Simon Schauss and Ralf Laemmel
--
module Language.FSML.Parser (fsm) where
import Language.FSML.Syntax
import Language.FSML.Lexer
import Text.Parsec hiding (State)
import Text.Parsec.String (Parser)
-- END ...
fsm :: Parser Fsm
fsm = Fsm <$> many state

state :: Parser State
state = do
  ini <- option False (symbol "initial" >> return True)
  source <- reserved "state" >> identifier
  ts <- braces (many (transition source))
  return (State ini source ts)

transition :: StateId -> Parser Transition
transition source =
  Transition
    <$> identifier
    <*> optionMaybe (reservedOp "/" *> identifier)
    <*> option source (reservedOp "->" *> identifier)
    <* semi
