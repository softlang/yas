# File _languages/BSL/Haskell/Language/BSL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/Haskell/Language/BSL/Syntax.hs)**
```
-- BEGIN ...
module Language.BSL.Syntax where
-- END ...
type Signature = [Profile]
type Profile = (Sym, [Sort], Sort)
type Sym = String
type Sort = String
```
