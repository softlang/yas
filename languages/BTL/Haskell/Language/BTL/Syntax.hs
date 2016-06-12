-- BEGIN ...
-- Syntax of BTL terms
module Language.BTL.Syntax where
-- END ...
data Term
  = TRUE -- True taken by Haskell Prelude
  | FALSE -- False taken by Haskell Prelude
  | Zero
  | Succ Term
  | Pred Term
  | IsZero Term
  | If Term Term Term
-- BEGIN ...
  deriving (Show)
-- END ...
