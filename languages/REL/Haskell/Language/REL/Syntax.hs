module Language.REL.Syntax where

-- | Abstract syntax of the regular expression language.
data REL
  = Empty
  | Eps
  | Lit Char
  | Alt REL REL
  | Seq REL REL
  | Star REL
  deriving (Eq, Show)

