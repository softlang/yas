# File _samples/Haskell/TestUntypedPower.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/Haskell/TestUntypedPower.hs)**
```
-- BEGIN ...
{-# LANGUAGE TemplateHaskell #-}
import UntypedPower
import Language.Haskell.TH
import Language.Haskell.TH.Syntax
-- END ...
power3 :: Int -> Int
power3 = $(mk_power 3)
-- BEGIN ...
main = do
  runQ (mk_power 3) >>= putStrLn . pprint
  print $ power3 3
-- END ...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('samples/Haskell/TestUntypedPower.hs',haskell(text))
