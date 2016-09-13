-- BEGIN ...
module Language.BGL.TopDownAcceptor where
import Language.BGL.Syntax
-- END ...
accept :: Grammar -> String -> Bool
accept rs = steps rs [N root]
  -- Pick start symbol
  where ((_, root, _):_) = rs

steps :: [Rule] -> [GSymbol] -> String -> Bool
-- Empty stack and all input consumed
steps _ [] [] = True
-- Consume a terminal from stack and input
steps rs (T t:stack) (t':ts) | t==t' = steps rs stack ts
-- Expand a nonterminal; choose an alternative 
steps rs (N n:stack) ts = or (map f rhss)
  where
    rhss = [ rhs | (_, n', rhs) <- rs, n == n' ]
    f rhs = steps rs (rhs++stack) ts
-- Otherwise parsing fails
steps _ _ _ = False
