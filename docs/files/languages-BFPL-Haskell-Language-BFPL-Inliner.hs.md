# File _languages/BFPL/Haskell/Language/BFPL/Inliner.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Haskell/Language/BFPL/Inliner.hs)**
```
-- BEGIN ...
module Language.BFPL.Inliner where
import Language.BFPL.Syntax
import Language.BFPL.Domains hiding (Env)
import Language.BFPL.Interpreter (uop, bop)
import Data.Map (Map, lookup, empty, fromList)
import Data.Maybe
...
```
