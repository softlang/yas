-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable, DeriveLift #-}
module Language.EL.QQ.Syntax (Expr(..), BOp(..), UOp(..)) where
import Language.EL.Syntax (UOp(..), BOp(..))
import Language.Haskell.TH.Syntax (Lift)
import Data.Generics
-- Expressions
-- END ...
data Expr
  = -- ... -- The same syntax as before
-- BEGIN ...
    IntConst Int
  | BoolConst Bool
  | Var String
  | Unary UOp Expr
  | Binary BOp Expr Expr
-- END ...
  | MetaVar String -- An additional constructor for the abstract syntax
-- BEGIN ...
  deriving (Eq, Read, Show, Lift, Typeable, Data)
-- END ...
