# File _languages/BNL/Haskell/Language/BNL/Parser.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Haskell/Language/BNL/Parser.hs)**
```
-- BEGIN ...
module Language.BNL.Parser where
import Language.BNL.Syntax
import Control.Monad

-- The parser type constructor
type Parser a = String -> Maybe (a, String)
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BNL/Haskell/Language/BNL/Parser.hs',haskell(text))
