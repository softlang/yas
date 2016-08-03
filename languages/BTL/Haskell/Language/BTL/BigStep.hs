-- BEGIN ...
module Language.BTL.BigStep where

import Language.BTL.Syntax
import Language.BTL.Nf
-- END ...
-- Evaluation of terms
evaluate :: Expr -> Maybe Expr
evaluate TRUE = Just TRUE
evaluate FALSE = Just FALSE
evaluate Zero = Just Zero
evaluate (Succ e) =
  case evaluate e of
    (Just n) ->
      if isNat n
        then Just (Succ n)
        else Nothing
    Nothing -> Nothing
evaluate (Pred e) =
  case evaluate e of
    (Just Zero) -> Just Zero
    (Just (Succ n)) ->
      if isNat n
        then Just n
        else Nothing
    _ -> Nothing
evaluate (IsZero e) =
  case evaluate e of
    (Just Zero) -> Just TRUE
    (Just (Succ n)) ->
      if isNat n
        then Just FALSE
        else Nothing
    _ -> Nothing
evaluate (If e0 e1 e2) =
  case evaluate e0 of
    (Just TRUE) -> evaluate e1
    (Just FALSE) -> evaluate e2
    _ -> Nothing
