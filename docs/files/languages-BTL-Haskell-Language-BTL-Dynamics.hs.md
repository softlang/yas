# File _languages/BTL/Haskell/Language/BTL/Dynamics.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Haskell/Language/BTL/Dynamics.hs)**
```
-- BEGIN ...
module Language.BTL.Dynamics where
import Data.TermRep
-- END ...
expr :: TermRep -> Bool
expr (TermRep "TRUE" []) = True
expr (TermRep "FALSE" []) = True
expr (TermRep "Zero" []) = True
expr (TermRep "Succ" [e]) = expr e
expr (TermRep "Pred" [e]) = expr e
expr (TermRep "IsZero" [e]) = expr e
expr (TermRep "If" es@[_,_,_]) = and (map expr es)
expr _ = False
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BTL/Haskell/Language/BTL/Dynamics.hs',haskell(text))
