# File _languages/BIPL/Haskell/Language/BIPL/Goto/Domains.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Haskell/Language/BIPL/Goto/Domains.hs)**
```
-- BEGIN ...
module Language.BIPL.Goto.Domains where

import Language.BIPL.DS.Domains
-- END ...
type Gotos = [(String, StoreT)] -- Goto tables
type StoreTT' = (StoreT, Gotos) -> (StoreT, Gotos) -- Transformation with gotos
```
