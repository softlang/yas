-- BEGIN ...
module Language.BTL.SmallStep where

import Language.BTL.Syntax
import Language.BTL.Nf
-- END ...
-- One-step reduction of terms
step :: Term -> Maybe Term
step (Succ t) =
  case step t of
    (Just t') -> Just (Succ t')
    Nothing -> Nothing
step (Pred t) =
  case step t of
    (Just t') -> Just (Pred t')
    Nothing -> case t of
                 Zero -> Just Zero
                 (Succ n) -> if isNat n then Just n else Nothing
                 _ -> Nothing
step (IsZero t) =
  case step t of
    (Just t') -> Just (IsZero t')
    Nothing -> case t of
                 Zero -> Just TRUE
                 (Succ n) -> if isNat n then Just FALSE else Nothing
                 _ -> Nothing
step (If t0 t1 t2) =
  case step t0 of
    (Just t0') -> Just (If t0' t1 t2)
    Nothing -> case t0 of
                 TRUE -> Just t1
                 FALSE -> Just t2
                 _ -> Nothing
step _ = Nothing
