# File _languages/GBL/Haskell/Language/GBL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/GBL/Haskell/Language/GBL/Syntax.hs)**
```
-- BEGIN ...
module Language.GBL.Syntax where
import Data.IORef
-- END ...
newtype World = World {
  getPersons :: [IORef Person] }
data Person = Person {
  getName :: String,
  getBuddy :: Maybe (IORef Person) }
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/GBL/Haskell/Language/GBL/Syntax.hs',haskell(text))
