-- BEGIN ...
module Language.BGL.TopDownParser where
import Language.BGL.Syntax
import Language.BGL.CST
import Data.Tree
import Control.Monad
-- END ...
parse :: [Rule] -> String -> Maybe CST
parse g i = do
    (i', t) <- tree g (N s) i
    guard (i'==[])
    return t
  where
    -- Retrieve start symbol  
    ((_, s, _):_) = g

tree :: [Rule] -> GSymbol -> String -> Maybe (String, CST)
-- Consume terminal at top of stack from input
tree _ (T t) i = do
  guard ([t] == take 1 i)
  return (drop 1 i, Node (Left t) [])
-- Expand a nonterminal
tree g (N n) i = foldr mplus mzero (map rule g)
  where
    -- Try different alternatives
    rule :: Rule -> Maybe (String, CST)
    rule r@(_, n', rhs) = do
      guard (n==n')
      (i', cs) <- trees g rhs i
      return (i', Node (Right r) cs)

-- Parse symbol by symbol, sequentially
trees :: [Rule] -> [GSymbol] -> String -> Maybe (String, [CST])
trees _ [] i = return (i, [])
trees g (s:ss) i = do
  (i', c) <- tree g s i
  (i'', cs) <- trees g ss i'
  return (i'', c:cs)
