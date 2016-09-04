-- BEGIN ...
--
-- (C) 2016 softlang.org and Simon Schauss and Ralf Laemmel
--
module Language.FSML.Lexer where

import Text.Parsec hiding (State)
import Text.Parsec.Language (emptyDef)
import Text.Parsec.String (Parser)
import qualified Text.Parsec.Token as Token

-- END ...
fsmlDef :: Token.LanguageDef ()
fsmlDef = emptyDef
    { Token.commentStart     = "/*"
    , Token.commentEnd       = "*/"
    , Token.commentLine      = "//"
    , Token.identStart       = letter
    , Token.identLetter      = alphaNum
    , Token.nestedComments   = True
    , Token.reservedNames    = ["initial", "state"]
    , Token.reservedOpNames  = ["/", "->"]
    }

lexer :: Token.TokenParser ()
lexer = Token.makeTokenParser fsmlDef

braces :: Parser p -> Parser p
braces = Token.braces lexer

semi :: Parser String
semi = Token.semi lexer

reserved :: String -> Parser ()
reserved = Token.reserved lexer

op :: String -> Parser ()
op = Token.reservedOp lexer

symbol :: String -> Parser String
symbol = Token.symbol lexer

name :: Parser String
name = Token.identifier lexer
