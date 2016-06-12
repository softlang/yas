-- BEGIN ...
module Language.BIPL.Goto.Syntax where
import Language.BIPL.Syntax (Expr(..), BOp(..), UOp(..))
-- END ...
data Stmt
  = Skip
  | Assign String Expr
  | Seq Stmt Stmt
  | If Expr Stmt Stmt
  | Label String
  | Goto String
