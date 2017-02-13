-- BEGIN ...
module Language.TLL.Typing where
import Prelude hiding (lookup)
import Language.TLL.Syntax
import Data.Map (Map, lookup, insert)
-- END ...
-- Context for type checking
type Context = Map String Type

-- Type checking expressions
typeOf :: Context -> Expr -> Maybe Type
typeOf ctx (Var x) = lookup x ctx
typeOf ctx (Apply e1 e2) = do
  t1 <- typeOf ctx e1
  t2 <- typeOf ctx e2
  case (t1, t2) of
    ((FunType ta tr), ta') | ta == ta' -> Just tr
    _ -> Nothing
typeOf ctx (Lambda x t e) = do
  let ctx' = insert x t ctx
  t' <- typeOf ctx' e
  Just (FunType t t')
typeOf ctx (Fix e) |
    Just t@(FunType ta tr) <- typeOf ctx e,
    ta == tr =
  Just ta
-- ...
-- BEGIN ...
typeOf ctx TRUE = Just BoolType
typeOf ctx FALSE = Just BoolType
typeOf ctx Zero = Just NatType
typeOf ctx (Succ e) | Just NatType <- typeOf ctx e = Just NatType
typeOf ctx (Pred e) | Just NatType <- typeOf ctx e = Just NatType
typeOf ctx (IsZero e) | Just NatType <- typeOf ctx e = Just BoolType
typeOf ctx (If e1 e2 e3) |
    Just BoolType <- typeOf ctx e1,
    Just t2 <- typeOf ctx e2,
    Just t3 <- typeOf ctx e3,
    t2 == t3 =
  Just t2
-- END ...
typeOf _ _ = Nothing

