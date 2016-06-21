-- BEGIN ...
module Language.AL.Syntax where
-- END ...
data Instr
  = Const Int
  | Store String
  | Load String
  | Label String
  | Jump String
  | CJump String
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
  deriving Show
-- END ...
