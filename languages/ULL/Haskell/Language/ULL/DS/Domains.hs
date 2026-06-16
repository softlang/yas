module Language.ULL.DS.Domains where

import Data.Map (Map, empty)

-- Semantic values for ULL
data Value
  = VBool Bool
  | VNat  Int
  | VFun  (Value -> Maybe Value)

instance Show Value where
  show (VBool b) = show b
  show (VNat n)  = show n
  show (VFun _)  = "<function>"

-- Environments for the interpreter
type Env = Map String Value

-- The emoty environment for evaluating closed expressions
emptyEnv :: Env
emptyEnv = empty

-- Meanings of expressions
type Meaning = Env -> Maybe Value
