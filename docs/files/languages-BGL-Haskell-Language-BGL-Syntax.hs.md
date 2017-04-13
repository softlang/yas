# File _languages/BGL/Haskell/Language/BGL/Syntax.hs_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/Haskell/Language/BGL/Syntax.hs)**
```
-- BEGIN ...
module Language.BGL.Syntax where
-- END ...
type Grammar = [Rule]
type Rule = (Label, Nonterminal, [GSymbol])
data GSymbol = T Terminal | N Nonterminal
-- BEGIN ...
  deriving (Eq, Show)
-- END ...
type Label = String
type Terminal = Char
type Nonterminal = String
```

## Languages
* [Haskell](../languages/Haskell.md) (haskell(text))

## References
* elementOf('languages/BGL/Haskell/Language/BGL/Syntax.hs',haskell(text))
