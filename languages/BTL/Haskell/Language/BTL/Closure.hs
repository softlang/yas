-- BEGIN ...
module Language.BTL.Closure where

import Language.BTL.Syntax
import Language.BTL.Nf
import Language.BTL.SmallStep
-- END ...
-- Reflexive, transitive closure of one-step reduction
steps :: Expr -> Maybe Expr
steps e =
  if isValue e
    then Just e
    else case step e of
           (Just e') -> steps e'
           Nothing -> Nothing
