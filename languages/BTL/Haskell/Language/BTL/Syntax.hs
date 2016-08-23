-- BEGIN ...
-- Syntax of BTL terms
module Language.BTL.Syntax where
-- END ...
data Expr
  = TRUE -- True taken by Haskell Prelude
  | FALSE -- False taken by Haskell Prelude
  | Zero
  | Succ Expr
  | Pred Expr
  | IsZero Expr
  | If Expr Expr Expr
-- BEGIN ...
  deriving (Eq, Read, Show)
-- END ...
