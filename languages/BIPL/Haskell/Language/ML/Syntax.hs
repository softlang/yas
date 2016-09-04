-- BEGIN ...
module Language.ML.Syntax where
-- END ...
data Instr
  = Const Int
  | Store Int
  | Load Int
  | Jump Int
  | CJump Int
  | Not
  | Add
  -- ...
-- BEGIN ...
  | Sub
  | Mul
  | Lt
  | Leq
  | Eq
  | Geq
  | Gt
  | And
  | Or
  deriving (Eq, Show)
-- END ...
