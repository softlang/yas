-- BEGIN ...
module Language.EGL.Parser (grammar) where
import Language.EGL.Syntax
import Language.EGL.Lexer
import Text.Parsec hiding (label)
import Text.Parsec.String (Parser)
-- END ...
grammar :: Parser Grammar
grammar = many rule

rule :: Parser Rule
rule = (,,)
  <$> optionMaybe (symbol "[" *> label <* symbol "]") 
  <*> nonterminal <* symbol ":"
  <*> gsymbols <* semi

gsymbols :: Parser GSymbols
gsymbols = many gsymbol

gsymbol :: Parser GSymbol
gsymbol =
        (T <$> terminal)
    <|> (N <$> nonterminal)
    <|> (braces gsymbols >>= bracy)
  where 
    bracy x =
          (op "*" >> return (Star x))
      <|> (op "+" >> return (Plus x))
      <|> (op "?" >> return (Option x))

label = identifier
terminal = qstring
nonterminal = identifier
