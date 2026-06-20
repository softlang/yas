module Language.STL.Syntax where

-- | Abstract syntax of the Stream Transformation Language.
--
-- For simplicity, the language is first-order and Int-specific.
data STL
  = Id
  | Map Unary
  | Filter Pred
  | Take Int
  | Drop Int
  | Seq STL STL
  | Par Binary STL STL
  deriving (Eq, Show)

-- | Built-in unary integer functions.
data Unary
  = Inc
  | Dec
  | Double
  | Square
  | Negate
  deriving (Eq, Show)

-- | Built-in predicates on integers.
data Pred
  = Even
  | Odd
  | Positive
  | Negative
  | GreaterThan Int
  | LessThan Int
  deriving (Eq, Show)

-- | Built-in binary merger functions.
data Binary
  = Interleave
  | Fst
  | Snd
  deriving (Eq, Show)
