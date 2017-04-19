-- BOL: Basic OCL-like Language
module Language.BOL.Syntax where

-- Metamodels
type MM = [ClassDecl]
type ClassDecl = (Class, [PropDecl])
type PropDecl = (Prop, Type)
data Type = IntType | RefType Class | ListType Type

-- Invariants
type Inv = (Class, Form) -- Context times formula

data Form
 = Exists Expr Var Form
 | Lt Expr Expr

data Expr
 = Int Int
 | Var Var
 | Self
 | Dot Expr Prop

type Class = String -- Class names
type Prop = String -- Property names
type Var = String -- Variables
