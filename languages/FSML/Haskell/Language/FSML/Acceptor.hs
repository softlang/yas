-- BEGIN ...
--
-- (C) 2016 softlang.org and Simon Schauss and Ralf Laemmel
--
module Language.FSML.Acceptor
    ( fsm ) where

import Language.FSML.Syntax
import Language.FSML.Lexer
import Text.Parsec
import Text.Parsec.String
-- END ...
type Acceptor = Parsec String () ()
fsm, state, transition :: Acceptor
fsm = many state >> void
state =
      optional (symbol "initial")
   >> reserved "state"
   >> stateid
   >> braces (many transition)
   >> void
transition =
      event
   >> optional (op "/" >> action)
   >> optional (op "->" >> stateid)
   >> semi
   >> void
stateid = name
event = name
action = name
void = return ()
