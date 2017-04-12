# File _languages/BTL/Haskell/Language/BTL/SmartSyntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Haskell/Language/BTL/SmartSyntax.hs)**
```
-- BEGIN ...
-- Smart constructors for BTL terms
module Language.BTL.SmartSyntax where
import Language.BTL.Syntax
-- END ...
true, false, zero :: Maybe Expr
true = Just TRUE
...
```
