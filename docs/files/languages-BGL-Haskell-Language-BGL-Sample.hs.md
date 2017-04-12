# File _languages/BGL/Haskell/Language/BGL/Sample.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/Haskell/Language/BGL/Sample.hs)**
```
-- BEGIN ...
module Language.BGL.Sample where
import Language.BGL.Syntax
-- END ...
bnlGrammar :: Grammar
bnlGrammar = [
  ("number", "number", [N "bits", N "rest"]),
  ("single", "bits", [N "bit"]),
  ("many", "bits", [N "bit", N "bits"]),
  ("zero", "bit", [T '0']),
  ("one", "bit", [T '1']),
  ("integer", "rest", []),
  ("rational", "rest", [T '.', N "bits"])
 ]
```
