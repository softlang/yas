# File _languages/BGL/Haskell/Language/BGL/TopDownAcceptor.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/Haskell/Language/BGL/TopDownAcceptor.hs)**
```
-- BEGIN ...
module Language.BGL.TopDownAcceptor where
import Language.BGL.Syntax
-- END ...
accept :: [Rule] -> String -> Bool
accept g = steps g [N s]
  where
...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BGL/Haskell/Language/BGL/TopDownAcceptor.hs',haskell(text))
