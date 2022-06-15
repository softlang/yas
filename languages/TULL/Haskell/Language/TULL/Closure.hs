-- BEGIN ...
module Language.TULL.Closure where

import Language.TULL.Syntax
import Language.TULL.Value
import Language.TULL.SmallStep
-- END ...
steps :: Expr -> Maybe Expr
steps e =
  if isValue e
    then Just e
    else case step e of
           (Just e') -> steps e'
           Nothing -> Nothing
