module Semantics where

import Stdlib
import Syntax

data Value
  = IntVal Int
  | BoolVal Bool

type Env = List (Pair String Value)

evalP :: Program -> Option Value
evalP (Program fs e) = evalE fs Nil e

evalE :: List Function -> Env -> Expr -> Option Value
evalE _ _ (IntConst x) = Some (IntVal x)
evalE _ _ (BoolConst x) = Some (BoolVal x)
evalE fs env (Name x) = Some (second (find (testName x) env))
evalE fs env (If e0 e1 e2)
  = cond
      (evalE fs env e0)
      (evalE fs env e1)
      (evalE fs env e2) 
evalE fs env (Op o e1 e2)
  = op o 
      (evalE fs env e1)
      (evalE fs env e2)
evalE fs env (Apply f args)
  = apply fs
      (find (testFunction f) fs)
      (optionlist (maplist (evalE fs env) args))

apply :: List Function -> Function -> Option (List Value) -> Option Value
apply _ _ None = None
apply fs (Function _ (FunDef _ formals e)) (Some actuals) =
  evalE fs (ziplist formals actuals) e

cond :: Option Value -> Option Value -> Option Value -> Option Value
cond (Some (BoolVal b)) v1 v2 = if b then v1 else v2
cond _ _ _ = None

op :: Op -> Option Value -> Option Value -> Option Value
op Add (Some (IntVal x)) (Some (IntVal y)) = Some (IntVal (x+y))
op Sub (Some (IntVal x)) (Some (IntVal y)) = Some (IntVal (x-y))
op Mult (Some (IntVal x)) (Some (IntVal y)) = Some (IntVal (x*y))
op Eq (Some (IntVal x)) (Some (IntVal y)) = Some (BoolVal (x==y))
op _ _ _ = None
