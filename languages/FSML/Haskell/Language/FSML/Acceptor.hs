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
fsm = many state
state =
      optional (reserved "initial")
   >> reserved "state"
   >> stateid
   >> braces (many transition)
transition =
      event
   >> optional (op "/" >> action)
   >> optional (op "->" >> stateid)
   >> semi
stateid = name
event = name
action = name
