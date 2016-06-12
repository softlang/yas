module Syntax where

import Stdlib

data Program = Program (List Function) Expr
data Function = Function FunSig FunDef
data FunSig = FunSig String (List SimpleType) SimpleType
data FunDef = FunDef String (List String) Expr
data SimpleType = IntType | BoolType
data Expr
  = IntConst Int
  | BoolConst Bool
  | Name String
  | If Expr Expr Expr
  | Op Op Expr Expr
  | Apply String (List Expr)
data Op = Add | Sub | Mult | Eq

testName :: String -> Pair String a -> Bool
testName x (Pair y _) = x == y

testFunction :: String -> Function -> Bool
testFunction x (Function (FunSig y _ _) _) = x == y
