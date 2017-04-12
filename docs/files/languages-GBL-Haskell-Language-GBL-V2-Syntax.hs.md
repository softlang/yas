# File _languages/GBL/Haskell/Language/GBL/V2/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/Haskell/Language/GBL/V2/Syntax.hs)**
```
-- BEGIN ...
module Language.GBL.V2.Syntax where
-- END ...
newtype World = World { getPersons :: [Person] }
-- BEGIN ...
  deriving (Eq, Show, Read)
-- END ...
data Person = Person {
  getName :: String,
  getBuddy :: Maybe Person }
-- BEGIN ...
  deriving (Eq, Show, Read)
-- END ...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/GBL/Haskell/Language/GBL/V2/Syntax.hs',haskell(text))
