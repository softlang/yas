module Types where

import Stdlib
import Syntax

type TypeEnv = List (Pair String SimpleType)

okP :: Program -> Bool
okP (Program fs e) = okE fs Nil e

okE :: List Function -> TypeEnv -> Expr -> SimpleType
okE _ _ (IntConst _) = IntType
okE _ _ (BoolConst _) = BoolType

{-
okE fs env (Name x) = second (find (testName x) env)
okE fs env (If e0 e1 e2)
  = cond
      (okE fs env e0)
      (okE fs env e1)
      (okE fs env e2) 
okE fs env (Op o e1 e2)
  = op o 
      (okE fs env e1)
      (okE fs env e2)
okE fs env (Apply f args)
  = apply fs
      (find (testFunction f) fs)
      (maplist (okE fs env) args)

apply :: List Function -> Function -> List Value -> Value
apply fs (Function _ (FunDef _ formals e)) actuals =
  okE fs (ziplist formals actuals) e

cond :: Value -> Value -> Value -> Value
cond (BoolVal b) v1 v2 = if b then v1 else v2
cond _ _ _ = ErrorVal

op :: Op -> Value -> Value -> Value
op Add (IntVal x) (IntVal y) = IntVal (x+y)
op Sub (IntVal x) (IntVal y) = IntVal (x-y) 
op Mult (IntVal x) (IntVal y) = IntVal (x*y)
op Eq (IntVal x) (IntVal y) = BoolVal (x==y)
op _ _ _ = ErrorVal
-}
