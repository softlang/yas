# File _languages/TLL/Haskell/Language/TLL/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TLL/Haskell/Language/TLL/Sample.hs)**
```
-- BEGIN ...
module Language.TLL.Sample where
import Language.TLL.Syntax
-- END ...
add = Fix (Lambda "f" (FunType NatType (FunType NatType NatType))
          (Lambda "n" NatType
          (Lambda "m" NatType
            (If (IsZero (Var "n"))
               (Var "m")
               (Succ (Apply (Apply (Var "f") (Pred (Var "n"))) (Var "m"))))))) 
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/TLL/Haskell/Language/TLL/Sample.hs',haskell(text))
