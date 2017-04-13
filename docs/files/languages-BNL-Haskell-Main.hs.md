# File _languages/BNL/Haskell/Main.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Haskell/Main.hs)**
```
import Language.BNL.Syntax
import Language.BNL.Conversion 
import qualified Language.BNL.BacktrackingAcceptor as A1
import qualified Language.BNL.LookAheadAcceptor as A2
import qualified Language.BNL.Parser as P
import Test.HUnit (runTestTT, Test(TestLabel, TestList), errors, failures, (~=?))
import System.Exit (exitSuccess, exitFailure)
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BNL/Haskell/Main.hs',haskell(text))
