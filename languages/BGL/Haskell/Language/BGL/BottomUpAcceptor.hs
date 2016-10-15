-- BEGIN ...
module Language.BGL.BottomUpAcceptor where
import Language.BGL.Syntax
import Data.List (sortOn)
-- END ...
accept :: [Rule] -> String -> Bool
accept g = steps g [] -- Begin with empty stack

steps :: [Rule] -> [GSymbol] -> String -> Bool
-- Acceptance succeeds (start symbol on stack, all input consumed)
steps g [N s] [] | s == s' = True
  where
    -- Retrieve start symbol
    ((_, s', _):_) = g
-- Shift or reduce
steps g z i = shift || reduce
  where
    -- Shift terminal from input to stack
    shift = not (null i) && steps g (T (head i) : z) (tail i)
    -- Reduce prefix on stack to nonterminal
    reduce = not (null zs) && or (map (\z -> steps g z i) zs)
      where
        -- Retrieve relevant reductions
        zs = [ N n : drop l z
             | (_, n, rhs) <- g,
               let l = length rhs,
               take l z == reverse rhs ]
