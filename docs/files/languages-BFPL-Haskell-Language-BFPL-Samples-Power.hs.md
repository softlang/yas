# File _languages/BFPL/Haskell/Language/BFPL/Samples/Power.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Haskell/Language/BFPL/Samples/Power.hs)**
```
-- BEGIN ...
module Language.BFPL.Samples.Power where
import Language.BFPL.Syntax
-- END ...
power :: Function
power = (
  "power",
  (([IntType, IntType], IntType),
   (["n", "x"],
     If (Binary Eq (Arg "n") (IntConst 0))
        (IntConst 1)
        (Binary Mul
            (Arg "x")
            (Apply "power" [Binary Sub (Arg "n") (IntConst 1), Arg "x"])))))
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BFPL/Haskell/Language/BFPL/Samples/Power.hs',haskell(text))
