-- BEGIN ...
module Language.EGL.Lexer where
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
    , Token.reservedNames    = []
    , Token.reservedOpNames  = ["*", "+", "?"]
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

identifier :: Parser String
identifier = Token.identifier lexer

qstring :: Parser String
qstring =
     string "'"
  *> (many $ noneOf "'")
  <* string "'"
  <* spaces
