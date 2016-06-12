-- BEGIN ...
module Language.BIPL.Interpreter where

import Language.BIPL.Syntax
import Language.BIPL.Domains
import Data.Map ((!), insert)
-- END ...
-- Execution of statements
execute :: Stmt -> Store -> Store
execute Skip m = m
execute (Assign x e) m = insert x (evaluate e m) m
execute (Seq s1 s2) m = execute s2 (execute s1 m)
execute (If e s1 s2) m = execute (if b then s1 else s2) m where Right b = evaluate e m
execute (While e s) m = execute (If e (Seq s (While e s)) Skip) m

-- Evaluation of expressions
evaluate :: Expr -> Store -> Value
evaluate (IntConst i) _ = Left i
evaluate (Var x) m = m!x
evaluate (Unary o e) m = uop o (evaluate e m)
evaluate (Binary o e1 e2) m = bop o (evaluate e1 m) (evaluate e2 m)

-- Interpretation of unary operators
uop :: UOp -> Value -> Value 
uop Negate (Left i) = Left (negate i)
uop Not (Right b) = Right (not b)

-- Interpretation of binary operators
bop :: BOp -> Value -> Value -> Value
bop Add (Left i1) (Left i2) = Left (i1+i2)
-- ...
-- BEGIN ...
bop Sub (Left i1) (Left i2) = Left (i1-i2)
bop Mul (Left i1) (Left i2) = Left (i1*i2)
bop Eq (Left i1) (Left i2) = Right (i1==i2)
bop Geq (Left i1) (Left i2) = Right (i1>=i2)
-- END ...
