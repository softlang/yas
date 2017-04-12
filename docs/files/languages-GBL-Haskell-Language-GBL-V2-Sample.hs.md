# File _languages/GBL/Haskell/Language/GBL/V2/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/Haskell/Language/GBL/V2/Sample.hs)**
```
-- BEGIN ...
module Language.GBL.V2.Sample where
import Language.GBL.V2.Syntax
-- END ...
smallWorld :: World
smallWorld = World [p1, p2]
  where
    p1, p2 :: Person
    p1 = Person { getName = "joe", getBuddy = Just p2 }
    p2 = Person { getName = "bill", getBuddy = Just p1 }
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/GBL/Haskell/Language/GBL/V2/Sample.hs',haskell(text))
