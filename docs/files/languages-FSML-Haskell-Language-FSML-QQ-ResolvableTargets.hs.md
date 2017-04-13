# File _languages/FSML/Haskell/Language/FSML/QQ/ResolvableTargets.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Haskell/Language/FSML/QQ/ResolvableTargets.hs)**
```
-- BEGIN ...
{-# LANGUAGE QuasiQuotes #-}
-- Negative test case for resolvableTargets check
module Language.FSML.QQ.ResolvableTargets where
import Language.FSML.Quoter
import Language.FSML.Syntax
-- END ...
sampleFsm :: Fsm
sampleFsm = [fsml|
        initial state state1 {
                event1 -> state2;
        }
|]
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/FSML/Haskell/Language/FSML/QQ/ResolvableTargets.hs',haskell(text))
