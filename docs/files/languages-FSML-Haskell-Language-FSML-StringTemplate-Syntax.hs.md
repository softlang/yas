# File _languages/FSML/Haskell/Language/FSML/StringTemplate/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Haskell/Language/FSML/StringTemplate/Syntax.hs)**
```
-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable #-}
module Language.FSML.StringTemplate.Syntax where
import Data.Typeable
import Data.Data
-- END ...
newtype Fsm = Fsm { states :: [State] }
...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/FSML/Haskell/Language/FSML/StringTemplate/Syntax.hs',haskell(text))
