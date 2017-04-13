# File _languages/TBL/Haskell/Language/TBL/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/Haskell/Language/TBL/Sample.hs)**
```
-- BEGIN ...
module Language.TBL.Sample where
import Language.TBL.Syntax
-- END ...
smallWorld :: World
smallWorld = World [
    Person { getName = "joe", getBuddy = Just "bill" },
    Person { getName = "bill", getBuddy = Just "joe" }
  ]
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/TBL/Haskell/Language/TBL/Sample.hs',haskell(text))
