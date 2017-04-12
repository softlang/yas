# File _languages/BTL/Haskell/Language/BTL/Universal/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Haskell/Language/BTL/Universal/Sample.hs)**
```
-- BEGIN ...
module Language.BTL.Universal.Sample where
import Data.TermRep
-- END ...
sampleExpr :: TermRep
sampleExpr =
  TermRep "Pred" [
    TermRep "If" [
      TermRep "IsZero" [TermRep "Zero" []],
      TermRep "Succ" [TermRep "Zero" []],
      TermRep "Zero" [] ]]
```
