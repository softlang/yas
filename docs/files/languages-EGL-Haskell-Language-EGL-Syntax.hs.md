# File _languages/EGL/Haskell/Language/EGL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/Haskell/Language/EGL/Syntax.hs)**
```
-- BEGIN ...
module Language.EGL.Syntax where
-- END ...
type Grammar = [Rule]
type Rule = (Maybe Label, Nonterminal, GSymbols)
type GSymbols = [GSymbol]
data GSymbol
...
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/EGL/Haskell/Language/EGL/Syntax.hs',haskell(text))
