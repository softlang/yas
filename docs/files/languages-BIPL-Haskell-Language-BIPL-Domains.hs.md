# File _languages/BIPL/Haskell/Language/BIPL/Domains.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Haskell/Language/BIPL/Domains.hs)**
```
-- BEGIN ...
module Language.BIPL.Domains where

import Data.Map (Map)
-- END ...
-- Results of expression evaluation
type Value = Either Int Bool
-- Stores as maps from variable names to values
type Store = Map String Value
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BIPL/Haskell/Language/BIPL/Domains.hs',haskell(text))
