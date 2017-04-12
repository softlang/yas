# File _languages/BGL/Haskell/Language/BGL/BottomUpAcceptor.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/Haskell/Language/BGL/BottomUpAcceptor.hs)**
```
-- BEGIN ...
module Language.BGL.BottomUpAcceptor where
import Language.BGL.Syntax
import Data.List (sortOn)
-- END ...
accept :: [Rule] -> String -> Bool
accept g = steps g [] -- Begin with empty stack
...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BGL/Haskell/Language/BGL/BottomUpAcceptor.hs',haskell(text))
