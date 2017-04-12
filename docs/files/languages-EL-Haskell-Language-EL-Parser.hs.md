# File _languages/EL/Haskell/Language/EL/Parser.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Haskell/Language/EL/Parser.hs)**
```
module Language.EL.Parser(expr) where
import Language.EL.Syntax
import Language.EL.Lexer
import Text.Parsec
import Text.Parsec.String (Parser)

expr :: Parser Expr
...
```
