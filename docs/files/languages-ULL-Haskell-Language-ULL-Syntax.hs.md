# File _languages/ULL/Haskell/Language/ULL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ULL/Haskell/Language/ULL/Syntax.hs)**
```
-- BEGIN ...
module Language.ULL.Syntax where
-- END ...
data Expr
  -- The untyped lambda calculus
  = Var String | Lambda String Expr | Apply Expr Expr
  -- BTL (Basic TAPL Language)
  | TRUE | FALSE | Zero | Succ Expr | Pred Expr | IsZero Expr | If Expr Expr Expr
  -- Fixed-point combinator
  | Fix Expr
-- BEGIN ...
  deriving (Eq, Show, Read)
-- END ...
```

## Languages
* [Haskell](../languages/Haskell.md)

## References
* elementOf('languages/ULL/Haskell/Language/ULL/Syntax.hs',haskell(text))
