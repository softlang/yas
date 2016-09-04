-- BEGIN ...
module Language.AL.Syntax where
-- END ...
data Instr
  = Const Int -- Push a constant onto the stack
  | Store String -- Store TOS in storage and pop TOS
  | Load String -- Push a storage cell's content onto stack
  | Label String -- Place a label as an address for jumps
  | Jump String -- Jump to a label
  | CJump String -- Jump to a label, if TOS is nonzero; also pop TOS
  | Not -- Apply negation to TOS and replace it by result
  | Add -- Apply addition to the two topmost stack elements; pop them; push result
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
