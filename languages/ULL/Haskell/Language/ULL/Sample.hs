-- BEGIN ...
module Language.ULL.Sample where
import Language.ULL.Syntax
-- END ...
add = Fix (Lambda "f" (Lambda "n" (Lambda "m"
            (If (IsZero (Var "n"))
               (Var "m")
               (Succ (Apply (Apply (Var "f") (Pred (Var "n"))) (Var "m"))))))) 
