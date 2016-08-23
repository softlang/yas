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
      optional (symbol "initial")
   >> reserved "state"
   >> identifier
   >> braces (many transition)
transition =
      identifier
   >> optional (reservedOp "/" >> identifier)
   >> optional (reservedOp "->" >> identifier)
   >> semi
