# File _languages/BGL/Haskell/Language/BGL/SampleWithoutEpsilon.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/Haskell/Language/BGL/SampleWithoutEpsilon.hs)**
```
-- BEGIN ...
module Language.BGL.SampleWithoutEpsilon where
import Language.BGL.Syntax
-- END ...
bnlGrammar :: Grammar
bnlGrammar = [
  ("integer", "number", [N "bits", N "rest"]),
  ("integer", "number", [N "bits", T '.', N "bits"]),
  ("single", "bits", [N "bit"]),
  ("many", "bits", [N "bit", N "bits"]),
  ("zero", "bit", [T '0']),
  ("one", "bit", [T '1'])
 ]
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/BGL/Haskell/Language/BGL/SampleWithoutEpsilon.hs',haskell(text))
