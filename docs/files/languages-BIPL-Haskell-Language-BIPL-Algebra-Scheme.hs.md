# File _languages/BIPL/Haskell/Language/BIPL/Algebra/Scheme.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Haskell/Language/BIPL/Algebra/Scheme.hs)**
```
-- BEGIN ...
-- Interpret program in terms of given algebra
module Language.BIPL.Algebra.Scheme where
import Language.BIPL.Syntax
import Language.BIPL.Algebra.Signature
-- END ...
interpret :: Alg sto val -> Stmt -> sto -> sto
...
```
