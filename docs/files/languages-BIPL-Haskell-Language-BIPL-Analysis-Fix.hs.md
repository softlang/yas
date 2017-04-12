# File _languages/BIPL/Haskell/Language/BIPL/Analysis/Fix.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Haskell/Language/BIPL/Analysis/Fix.hs)**
```
-- BEGIN ...
module Language.BIPL.Analysis.Fix where
-- END ...
fix' :: Eq a => ((a -> a) -> a -> a) -> (a -> a) -> a -> a
fix' h i x = limit (iterate h i)
  where limit (b1:b2:bs) = if b1 x == b2 x then b1 x else limit (b2:bs)
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BIPL/Haskell/Language/BIPL/Analysis/Fix.hs',haskell(text))
