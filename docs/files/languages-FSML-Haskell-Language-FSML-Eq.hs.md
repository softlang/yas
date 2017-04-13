# File _languages/FSML/Haskell/Language/FSML/Eq.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Haskell/Language/FSML/Eq.hs)**
```
-- BEGIN ...
module Language.FSML.Eq where
import Language.FSML.Syntax (Fsm, getStates)
import Language.FSML.Normalization
-- END ...
instance Eq Fsm where
  x == y = getStates (normalize x) == getStates (normalize y)
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/FSML/Haskell/Language/FSML/Eq.hs',haskell(text))
