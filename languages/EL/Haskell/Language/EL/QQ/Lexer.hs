module Language.EL.QQ.Lexer where

import Text.Parsec
import Text.Parsec.Language (emptyDef)
import Text.Parsec.String (Parser)
import qualified Text.Parsec.Token as Token

elDef :: Token.LanguageDef ()
elDef = emptyDef
    { Token.identStart       = letter
    , Token.identLetter      = alphaNum
    , Token.reservedNames    = []
    , Token.reservedOpNames  = ["$", "||", "&&", "<", "<=", "==", ">=", ">", "+", "-", "*", "!"]
    }

lexer :: Token.TokenParser ()
lexer = Token.makeTokenParser elDef

parens :: Parser p -> Parser p
parens = Token.parens lexer

op :: String -> Parser ()
op = Token.reservedOp lexer

identifier :: Parser String
identifier = Token.identifier lexer

int :: Parser Int
int = Token.integer lexer >>= return . fromInteger
