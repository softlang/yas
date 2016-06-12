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
wellTyped :: Term -> Bool
wellTyped t =
  case typeOf t of
    Just _ -> True
    Nothing -> False

-- Type inference for terms
typeOf :: Term -> Maybe Type
typeOf TRUE = Just Bool
typeOf FALSE = Just Bool
typeOf Zero = Just Nat
typeOf (Succ t) =
  case typeOf t of
    (Just Nat) -> Just Nat
    _ -> Nothing
typeOf (Pred t) =
  case typeOf t of
    (Just Nat) -> Just Nat
    _ -> Nothing
typeOf (IsZero t) =
  case typeOf t of
    (Just Nat) -> Just Bool
    _ -> Nothing
typeOf (If t0 t1 t2) =
  case typeOf t0 of
    (Just Bool) ->
      case (typeOf t1, typeOf t2) of
        (Just ty1, Just ty2) -> if ty1==ty2 then Just ty1 else Nothing
        _ -> Nothing
