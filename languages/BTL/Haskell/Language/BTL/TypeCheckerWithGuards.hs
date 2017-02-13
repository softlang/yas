-- BEGIN ...
module Language.BTL.TypeCheckerWithGuards where
import Language.BTL.Syntax
-- END ...
-- Types of expressions
data Type = NatType | BoolType
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Well-typedness of expressions
wellTyped :: Expr -> Bool
wellTyped e | Just _ <- typeOf e = True
wellTyped e | otherwise = False

-- Types of expressions
typeOf :: Expr -> Maybe Type
typeOf TRUE = Just BoolType
typeOf FALSE = Just BoolType
typeOf Zero = Just NatType
typeOf (Succ e) | Just NatType <- typeOf e = Just NatType
typeOf (Pred e) | Just NatType <- typeOf e = Just NatType
typeOf (IsZero e) | Just NatType <- typeOf e = Just BoolType
typeOf (If e0 e1 e2) |
  Just BoolType <- typeOf e0,
  Just t1 <- typeOf e1,
  Just t2 <- typeOf e2,
  t1 == t2 = Just t1
typeOf _ = Nothing
