# File _languages/FSML/Haskell/Language/FSML/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Haskell/Language/FSML/Syntax.hs)**
```
-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable, DeriveLift #-}
module Language.FSML.Syntax where
import Language.Haskell.TH.Syntax (Lift)
import Data.Generics
-- END ...
data Fsm = Fsm { getStates :: [State] }
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/FSML/Haskell/Language/FSML/Syntax.hs',haskell(text))
