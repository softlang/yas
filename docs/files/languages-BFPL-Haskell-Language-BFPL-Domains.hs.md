# File _languages/BFPL/Haskell/Language/BFPL/Domains.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Haskell/Language/BFPL/Domains.hs)**
```
-- BEGIN ...
module Language.BFPL.Domains where

import Data.Map (Map)
-- END ...
-- Results of expression evaluation
type Value = Either Int Bool
-- Environments as maps from argument names to values
type Env = Map String Value
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BFPL/Haskell/Language/BFPL/Domains.hs',haskell(text))
