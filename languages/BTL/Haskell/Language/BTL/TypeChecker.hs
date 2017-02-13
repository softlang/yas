-- BEGIN ...
module Language.BTL.TypeChecker where
import Language.BTL.Syntax
-- END ...
-- Types of expressions
data Type = NatType | BoolType
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Well-typedness of expressions
wellTyped :: Expr -> Bool
wellTyped e = case typeOf e of { Just _ -> True; Nothing -> False }

-- Types of expressions
typeOf :: Expr -> Maybe Type
typeOf TRUE = Just BoolType
typeOf FALSE = Just BoolType
typeOf Zero = Just NatType
typeOf (Succ e) = case typeOf e of { Just NatType -> Just NatType; _ -> Nothing }
typeOf (Pred e) = case typeOf e of { Just NatType -> Just NatType; _ -> Nothing }
typeOf (IsZero e) = case typeOf e of { Just NatType -> Just BoolType; _ -> Nothing }
typeOf (If e0 e1 e2) =
  case typeOf e0 of
    (Just BoolType) ->
      case (typeOf e1, typeOf e2) of
        (Just t1, Just t2) -> if t1==t2 then Just t1 else Nothing
        _ -> Nothing
