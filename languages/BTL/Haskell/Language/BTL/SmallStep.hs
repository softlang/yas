-- BEGIN ...
module Language.BTL.SmallStep where

import Language.BTL.Syntax
import Language.BTL.Nf
-- END ...
-- One-step reduction of terms
step :: Expr -> Maybe Expr
step (Succ e) =
  case step e of
    (Just e') -> Just (Succ e')
    Nothing -> Nothing
step (Pred e) =
  case step e of
    (Just e') -> Just (Pred e')
    Nothing -> case e of
                 Zero -> Just Zero
                 (Succ n) -> if isNat n then Just n else Nothing
                 _ -> Nothing
step (IsZero e) =
  case step e of
    (Just e') -> Just (IsZero e')
    Nothing -> case e of
                 Zero -> Just TRUE
                 (Succ n) -> if isNat n then Just FALSE else Nothing
                 _ -> Nothing
step (If e0 e1 e2) =
  case step e0 of
    (Just e0') -> Just (If e0' e1 e2)
    Nothing -> case e0 of
                 TRUE -> Just e1
                 FALSE -> Just e2
                 _ -> Nothing
step _ = Nothing
