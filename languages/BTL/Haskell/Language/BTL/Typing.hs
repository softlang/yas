-- BEGIN ...
module Language.BTL.Typing where

import Language.BTL.Syntax
-- END ...
-- Types of terms
data Type = Nat | Bool
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

-- Well-typedness of terms
wellTyped :: Expr -> Bool
wellTyped e =
  case typeOf e of
    Just _ -> True
    Nothing -> False

-- Type inference for terms
typeOf :: Expr -> Maybe Type
typeOf TRUE = Just Bool
typeOf FALSE = Just Bool
typeOf Zero = Just Nat
typeOf (Succ e) =
  case typeOf e of
    (Just Nat) -> Just Nat
    _ -> Nothing
typeOf (Pred e) =
  case typeOf e of
    (Just Nat) -> Just Nat
    _ -> Nothing
typeOf (IsZero e) =
  case typeOf e of
    (Just Nat) -> Just Bool
    _ -> Nothing
typeOf (If e0 e1 e2) =
  case typeOf e0 of
    (Just Bool) ->
      case (typeOf e1, typeOf e2) of
        (Just t1, Just t2) -> if t1==t2 then Just t1 else Nothing
        _ -> Nothing
