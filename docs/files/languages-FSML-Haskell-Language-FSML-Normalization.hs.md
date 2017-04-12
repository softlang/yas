# File _languages/FSML/Haskell/Language/FSML/Normalization.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Haskell/Language/FSML/Normalization.hs)**
```
-- BEGIN ...
module Language.FSML.Normalization where
import Language.FSML.Syntax
import Data.List (sort, sortOn)
-- END ...
normalize :: Fsm -> Fsm
normalize =
    Fsm
  . sortOn getId
  . map (\s -> State (getInitial s) (getId s) (sort (getTransitions s)))
  . getStates
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/FSML/Haskell/Language/FSML/Normalization.hs',haskell(text))
