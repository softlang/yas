# File _languages/BGL/Haskell/Language/BGL/SampleWithGreediness.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/Haskell/Language/BGL/SampleWithGreediness.hs)**
```
-- BEGIN ...
module Language.BGL.SampleWithGreediness where
import Language.BGL.Syntax
-- END ...
bnlGrammar :: Grammar
bnlGrammar = [
  ("number", "number", [N "bits", N "rest"]),
  ("many", "bits", [N "bit", N "bits"]),
  ("single", "bits", [N "bit"]),
  ("zero", "bit", [T '0']),
  ("one", "bit", [T '1']),
  ("rational", "rest", [T '.', N "bits"]),
  ("integer", "rest", [])
 ]
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BGL/Haskell/Language/BGL/SampleWithGreediness.hs',haskell(text))
