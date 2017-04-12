# File _languages/BNL/Haskell/Language/BNL/LookAheadAcceptor.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Haskell/Language/BNL/LookAheadAcceptor.hs)**
```
-- BEGIN ...
module Language.BNL.LookAheadAcceptor where
import Control.Monad
-- Accept and enforce complete input consumption 
accept :: String -> Bool
accept i = case number i of
  Just [] -> True
...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BNL/Haskell/Language/BNL/LookAheadAcceptor.hs',haskell(text))
