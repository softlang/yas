-- BEGIN ...
module Language.BTL.Sample where

import Language.BTL.Syntax
-- END ...
sample :: Expr
sample = Pred (If (IsZero Zero) (Succ (Succ Zero)) Zero)
