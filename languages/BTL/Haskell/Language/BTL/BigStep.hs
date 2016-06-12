-- BEGIN ...
module Language.BTL.BigStep where

import Language.BTL.Syntax
import Language.BTL.Nf
-- END ...
-- Evaluation of terms
evaluate :: Term -> Maybe Term
evaluate TRUE = Just TRUE
evaluate FALSE = Just FALSE
evaluate Zero = Just Zero
evaluate (Succ t) =
  case evaluate t of
    (Just n) ->
      if isNat n
        then Just (Succ n)
        else Nothing
    Nothing -> Nothing
evaluate (Pred t) =
  case evaluate t of
    (Just Zero) -> Just Zero
    (Just (Succ n)) ->
      if isNat n
        then Just n
        else Nothing
    _ -> Nothing
evaluate (IsZero t) =
  case evaluate t of
    (Just Zero) -> Just TRUE
    (Just (Succ n)) ->
      if isNat n
        then Just FALSE
        else Nothing
    _ -> Nothing
evaluate (If t0 t1 t2) =
  case evaluate t0 of
    (Just TRUE) -> evaluate t1
    (Just FALSE) -> evaluate t2
    _ -> Nothing
