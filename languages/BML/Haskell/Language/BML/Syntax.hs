-- BEGIN ...
module Language.BML.Syntax where
-- END ...
data Instr
  = Const Int -- Push a constant onto the stack
  | Store Int -- Store TOS in storage and pop TOS
  | Load Int -- Push a storage cell's content onto stack
  | Jump Int -- Jump to an address
  | CJump Int -- Jump to an address, if TOS is nonzero; also pop TOS
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
