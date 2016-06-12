-- BEGIN ...
module Language.BTL.Closure where

import Language.BTL.Syntax
import Language.BTL.Nf
import Language.BTL.SmallStep
-- END ...
-- Reflexive, transitive closure of one-step reduction
steps :: Term -> Maybe Term
steps t =
  if isValue t
    then Just t
    else case step t of
           (Just t') -> steps t'
           Nothing -> Nothing
