-- BEGIN ...
module Language.BTL.TypeCheckerWithGuards where
import Language.BTL.Syntax
-- END ...
-- Types of expressions
data Type = Nat | Bool
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Well-typedness of expressions
wellTyped :: Expr -> Bool
wellTyped e | Just _ <- typeOf e = True
wellTyped e | otherwise = False

-- Types of expressions
typeOf :: Expr -> Maybe Type
typeOf TRUE = Just Bool
typeOf FALSE = Just Bool
typeOf Zero = Just Nat
typeOf (Succ e) | Just Nat <- typeOf e = Just Nat
typeOf (Pred e) | Just Nat <- typeOf e = Just Nat
typeOf (IsZero e) | Just Nat <- typeOf e = Just Bool
typeOf (If e0 e1 e2) |
  Just Bool <- typeOf e0,
  Just t1 <- typeOf e1,
  Just t2 <- typeOf e2,
  t1 == t2 = Just t1
typeOf _ = Nothing
