# File _languages/BIPL/Haskell/Language/BIPL/MonadicAlgebra/Signature.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/Haskell/Language/BIPL/MonadicAlgebra/Signature.hs)**
```
-- BEGIN ...
module Language.BIPL.MonadicAlgebra.Signature where
import Language.BIPL.Syntax (UOp, BOp)
-- END ...
-- Aliases to shorten function signatures
type Trafo m sto = sto -> m sto -- Store transformation
type Obs m sto val = sto -> m val -- Store observation
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BIPL/Haskell/Language/BIPL/MonadicAlgebra/Signature.hs',haskell(text))
