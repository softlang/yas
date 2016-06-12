-- BEGIN ...
-- Continuation-passing style
module Language.BIPL.CS.Interpreter where

import Language.BIPL.Syntax
import Language.BIPL.DS.Domains
import Language.BIPL.CS.Domains
import Language.BIPL.CS.Combinators
import Language.BIPL.Interpreter (evaluate)

-- END ...
execute :: Stmt -> StoreTT
execute Skip = skip'
execute (Assign x e) = assign' x (evaluate e)
execute (Seq s1 s2) = seq' (execute s1) (execute s2)
execute (If e s1 s2) = if' (evaluate e) (execute s1) (execute s2)
execute (While e s) = while' (evaluate e) (execute s)

-- Pass identity state transformer as top-level continuation
execute' :: Stmt -> StoreT
execute' s = execute s id
