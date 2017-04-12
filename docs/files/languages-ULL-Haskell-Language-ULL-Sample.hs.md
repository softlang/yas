# File _languages/ULL/Haskell/Language/ULL/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ULL/Haskell/Language/ULL/Sample.hs)**
```
-- BEGIN ...
module Language.ULL.Sample where
import Language.ULL.Syntax
-- END ...
add = Fix (Lambda "f" (Lambda "n" (Lambda "m"
            (If (IsZero (Var "n"))
               (Var "m")
               (Succ (Apply (Apply (Var "f") (Pred (Var "n"))) (Var "m"))))))) 
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/ULL/Haskell/Language/ULL/Sample.hs',haskell(text))
