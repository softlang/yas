# File _languages/BIPL/Haskell/Language/BIPL/MonadicAlgebra/Scheme.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Haskell/Language/BIPL/MonadicAlgebra/Scheme.hs)**
```
-- BEGIN ...
-- Interpret program in terms of given algebra
module Language.BIPL.MonadicAlgebra.Scheme where
import Language.BIPL.Syntax
import Language.BIPL.MonadicAlgebra.Signature
-- END ...
interpret :: Alg m sto val -> Stmt -> Trafo m sto
...
```
