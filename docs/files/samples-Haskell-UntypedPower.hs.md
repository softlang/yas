# File _samples/Haskell/UntypedPower.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/Haskell/UntypedPower.hs)**
```
-- BEGIN ...
{-# LANGUAGE TemplateHaskell #-}
module UntypedPower where
import Language.Haskell.TH
-- END ...
power :: Int -> Q Exp -> Q Exp
power n x =
  if n==0
    then [| 1 |]
    else [| $x * $(power (n-1) x) |]

mk_power :: Int -> Q Exp
mk_power n = [| \x -> $(power n [| x |]) |]
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('samples/Haskell/UntypedPower.hs',haskell(text))
