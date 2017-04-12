# File _languages/TLL/Haskell/Language/TLL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TLL/Haskell/Language/TLL/Syntax.hs)**
```
-- BEGIN ...
module Language.TLL.Syntax where
-- END ...
data Expr
  -- The typed lambda calculus
  = Var String | Lambda String Type Expr | Apply Expr Expr
  -- BTL (Basic TAPL Language)
...
```
