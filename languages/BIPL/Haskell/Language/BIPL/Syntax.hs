-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable #-}
module Language.BIPL.Syntax where
import Data.Data
import Data.Typeable
-- END ...
-- Statements
data Stmt
  = Skip
  | Assign String Expr
  | Seq Stmt Stmt
  | If Expr Stmt Stmt
  | While Expr Stmt
-- BEGIN ...
  deriving (Show, Data, Typeable)
-- END ...

-- Expressions
data Expr
  = IntConst Int
  | Var String
  | Unary UOp Expr
  | Binary BOp Expr Expr
-- BEGIN ...
  deriving (Show, Data, Typeable)
-- END ...

-- Unary and binary operators
data UOp = Negate | Not
-- BEGIN ...
  deriving (Show, Data, Typeable)
-- END ...
data BOp = Add | Sub | Mul | Lt | Leq | Eq | Geq | Gt | And | Or
-- BEGIN ...
  deriving (Show, Data, Typeable)
-- END ...
