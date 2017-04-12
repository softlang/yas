# File _languages/FSML/Haskell/Language/FSML/Extraction.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Haskell/Language/FSML/Extraction.hs)**
```
-- BEGIN ...
module Language.FSML.Extraction where
import Language.FSML.Syntax
import Data.Map (Map, fromList)
import Data.List (nub)
-- END ...
inouts :: Fsm -> Map StateId (Int, Int)
...
```
