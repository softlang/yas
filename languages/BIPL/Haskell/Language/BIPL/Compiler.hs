-- BEGIN ...
module Language.BIPL.Compiler (compile) where
import Language.BIPL.Syntax (Stmt(..), Expr(..))
import qualified Language.BIPL.Syntax as BIPL
import Language.AL.Syntax
-- END ...
compile :: Stmt -> [Instr]
compile s = fst (stmt s 0)

stmt :: Stmt -> Int -> ([Instr], Int)
stmt Skip l = ([], l)
stmt (Assign x e) l = (expr e ++ [Store x], l)
stmt (Seq s1 s2) l0 =
  let
    (zs1, l1) = stmt s1 l0
    (zs2, l2) = stmt s2 l1
  in (zs1 ++ zs2, l2)
stmt (If e s1 s2) l0 =
 let l1 = l0+1
     (zs1, l2) = stmt s1 (l1+1) 
     (zs2, l3) = stmt s2 l2
 in (expr e
     ++ (CJump (show l0) : zs2)
     ++ (Jump (show l1) : (Label (show l0) : zs1))
     ++ [Label (show l1)], l3)
stmt (While e s) l0 =
 let l1 = l0+1
     (zs, l2) = stmt s (l1+1) 
 in ([Label (show l0)] ++ expr e
     ++ (Not : (CJump (show l1) : zs))
     ++ [Jump (show l0), Label (show l1)], l2)

expr :: Expr -> [Instr]
expr (IntConst i) = [Const i]
expr (Var x) = [Load x]
expr (Unary BIPL.Negate e) = expr (Binary BIPL.Sub (IntConst 0) e)
expr (Unary BIPL.Not e) = expr e ++ [Not]
expr (Binary o e1 e2) = expr e1 ++ expr e2 ++
  [ case o of
       BIPL.Add -> Add
       -- ...
-- BEGIN ...
       BIPL.Sub -> Sub
       BIPL.Mul -> Mul
       BIPL.Lt -> Lt
       BIPL.Leq -> Leq
       BIPL.Eq -> Eq
       BIPL.Geq -> Geq
       BIPL.Gt -> Gt
       BIPL.And -> And
       BIPL.Or -> Or
  ]
-- END ...
