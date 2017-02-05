-- BEGIN ...
-- Interpret program in terms of given algebra
module Language.BIPL.MonadicAlgebra.Scheme where
import Language.BIPL.Syntax
import Language.BIPL.MonadicAlgebra.Signature
-- END ...
interpret :: Alg m sto val -> Stmt -> Trafo m sto
interpret a = execute
  where
    -- Compositional interpretation of statements
    execute Skip = skip' a
    execute (Assign x e) = assign' a x (evaluate e)
    execute (Seq s1 s2) = seq' a (execute s1) (execute s2)
    execute (If e s1 s2) = if' a (evaluate e) (execute s1) (execute s2)
    execute (While e s) = while' a (evaluate e) (execute s)
    -- Compositional interpretation of expressions
    evaluate (IntConst i) = intconst' a i
    evaluate (Var n) = var' a n
    evaluate (Unary o e) = unary' a o (evaluate e)
    evaluate (Binary o e1 e2) = binary' a o (evaluate e1) (evaluate e2)
