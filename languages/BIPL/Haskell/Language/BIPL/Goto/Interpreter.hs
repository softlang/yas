-- BEGIN ...
-- Continuation-passing style
module Language.BIPL.Goto.Interpreter where

import Language.BIPL.Goto.Syntax
import Language.BIPL.DS.Domains
import Language.BIPL.Goto.Domains
import Language.BIPL.Goto.Combinators
import Language.BIPL.Interpreter (evaluate)

-- END ...
execute :: Stmt -> StoreT
execute s = let (c, g) = execute' s (id, g) in c
  where
    execute' :: Stmt -> StoreTT'
    execute' Skip = skip'
    execute' (Assign x e) = assign' x (evaluate e)
    execute' (Seq s1 s2) = seq' (execute' s1) (execute' s2)
    execute' (If e s1 s2) = if' (evaluate e) (execute' s1) (execute' s2)
    execute' (Label l) = label' l
    execute' (Goto l) = goto' l
