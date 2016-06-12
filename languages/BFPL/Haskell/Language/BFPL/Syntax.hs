-- BEGIN ...
module Language.BFPL.Syntax where
-- END ...
-- Program = typed functions + main expression
type Program = (Functions, Expr)
type Functions = [Function]
type Function = (String, (FunSig, FunDef))
type FunSig = ([SimpleType], SimpleType)
type FunDef = ([String], Expr)

-- Simple types
data SimpleType = Int | Bool
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Expressions
data Expr
  = IntConst Int
  | BoolConst Bool
  | Arg String
  | If Expr Expr Expr
  | Unary UOp Expr
  | Binary BOp Expr Expr
  | Apply String [Expr]
-- BEGIN ...
  deriving (Show)
-- END ...

-- Unary and binary operators
data UOp = Negate | Not
-- BEGIN ...
  deriving Show
-- END ...
data BOp = Add | Sub | Mul | Lt | Leq | Eq | Geq | Gt | And | Or
-- BEGIN ...
  deriving Show
-- END ...

