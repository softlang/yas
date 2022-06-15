-- BEGIN ...
module Language.TULL.Sample where
import Language.TULL.Syntax
-- END ...

-- \f.(\x.f (\v.((x x) v))) (\x.f (\v.((x x) v)))
fix = Lambda "f" (Apply
        (Lambda "x" (Apply (Var "f") (Lambda "v" (Apply (Apply (Var "x") (Var "x")) (Var "v")))))
        (Lambda "x" (Apply (Var "f") (Lambda "v" (Apply (Apply (Var "x") (Var "x")) (Var "v")))))
      )

add = Apply
        fix
        (Lambda "f" (Lambda "n" (Lambda "m"
            (If (IsZero (Var "n"))
               (Var "m")
               (Succ (Apply (Apply (Var "f") (Pred (Var "n"))) (Var "m"))))))) 
