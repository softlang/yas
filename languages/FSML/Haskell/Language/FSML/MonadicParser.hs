-- BEGIN ...
module Language.FSML.MonadicParser (fsm) where
import Language.FSML.Syntax
import Language.FSML.Lexer
import Text.Parsec hiding (State)
import Text.Parsec.String (Parser)
-- END ...
fsm :: Parser Fsm
fsm = many state >>= return . Fsm

state :: Parser State
state = do
  ini <- option False (reserved "initial" >> return True)
  source <- reserved "state" >> stateid
  ts <- braces (many (transition source))
  return (State ini source ts)

transition :: StateId -> Parser Transition
transition source = do
  e <- event
  a <- optionMaybe (op "/" *> action)
  t <- option source (op "->" *> stateid)
  semi
  return (Transition e a t)
-- BEGIN ...
stateid = name
event = name
action = name
-- END ...
