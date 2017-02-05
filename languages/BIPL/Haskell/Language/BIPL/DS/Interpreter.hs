-- BEGIN ...
module Language.BIPL.DS.Interpreter where

import Language.BIPL.Syntax
import Language.BIPL.DS.Domains
import Language.BIPL.DS.Combinators
-- END ...
execute :: Stmt -> StoreT
execute Skip = skip'
execute (Assign x e) = assign' x (evaluate e)
execute (Seq s1 s2) = seq' (execute s1) (execute s2)
execute (If e s1 s2) = if' (evaluate e) (execute s1) (execute s2)
execute (While e s) = while' (evaluate e) (execute s)

evaluate :: Expr -> StoreO
evaluate (IntConst i) = intconst' i
evaluate (Var x) = var' x
evaluate (Unary o e) = unary' o (evaluate e)
evaluate (Binary o e1 e2) = binary' o (evaluate e1) (evaluate e2)
