-- BEGIN ...
module Language.EGL.Syntax where
-- END ...
type Grammar = [Rule]
type Rule = (Maybe Label, Nonterminal, GSymbols)
type GSymbols = [GSymbol]
data GSymbol
   = T Terminal
   | N Nonterminal
   | Star GSymbols
   | Plus GSymbols
   | Option GSymbols
-- BEGIN ...
  deriving (Eq, Show, Read)
-- END ...
type Label = String
type Terminal = String
type Nonterminal = String
