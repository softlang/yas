-- BEGIN ...
module Language.BLL.Closure where

import Language.BLL.Syntax
import Language.BLL.Nf
import Language.BLL.SmallStep
-- END ...
steps :: Expr -> Maybe Expr
steps e =
  if isValue e
    then Just e
    else case step e of
           (Just e') -> steps e'
           Nothing -> Nothing
