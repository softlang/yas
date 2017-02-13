-- BEGIN ...
module Language.TLL.Erasure where
-- END ...
import Language.TLL.Syntax as TLL
import Language.ULL.Syntax as ULL
erase :: TLL.Expr -> ULL.Expr
erase (TLL.Var x) = (ULL.Var x)
erase (TLL.Lambda x _ e) = (ULL.Lambda x (erase e))
erase (TLL.Apply e1 e2) = (ULL.Apply (erase e1) (erase e2))
erase (TLL.TRUE) = (ULL.TRUE)
-- ...
-- BEGIN ...
erase (TLL.FALSE) = (ULL.FALSE)
erase (TLL.Zero) = (ULL.Zero)
erase (TLL.Succ e) = (ULL.Succ (erase e))
erase (TLL.Pred e) = (ULL.Pred (erase e))
erase (TLL.IsZero e) = (ULL.IsZero (erase e))
erase (TLL.If e0 e1 e2) = (ULL.If (erase e0) (erase e1) (erase e2))
erase (TLL.Fix e) = (ULL.Fix (erase e))
-- END ...
