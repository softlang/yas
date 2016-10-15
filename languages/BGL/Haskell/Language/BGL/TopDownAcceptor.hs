-- BEGIN ...
module Language.BGL.TopDownAcceptor where
import Language.BGL.Syntax
-- END ...
accept :: [Rule] -> String -> Bool
accept g = steps g [N s]
  where
    -- Retrieve start symbol  
    ((_, s, _):_) = g

steps :: [Rule] -> [GSymbol] -> String -> Bool
-- Acceptance succeeds (empty stack, all input consumed)
steps _ [] [] = True
-- Consume terminal at top of stack from input
steps g (T t:z) (t':i) | t==t' = steps g z i
-- Expand a nonterminal; try different alternatives
steps g (N n:z) i = or (map (\rhs -> steps g (rhs++z) i) rhss)
  where
    rhss = [ rhs | (_, n', rhs) <- g, n == n' ]
-- Otherwise parsing fails
steps _ _ _ = False
