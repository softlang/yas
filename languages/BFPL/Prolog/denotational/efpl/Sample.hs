module Sample where

import Stdlib
import Syntax

sample :: Program
sample = Program 
  (Cons 
    (Function 
      (FunSig "factorial" (Cons IntType Nil) IntType )
      (FunDef "factorial" (Cons "x" Nil)
        (If (Op Eq (Name "x") (IntConst 0))
           (IntConst 1)
           (Op Mult (Name "x")
             (Apply "factorial"
               (Cons (Op Sub (Name "x") (IntConst 1)) Nil))))))
  Nil)
  (Apply "factorial" (Cons (IntConst 5) Nil))
