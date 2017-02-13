-- BEGIN ...
module Language.ULL.Closure where

import Language.ULL.Syntax
import Language.ULL.Value
import Language.ULL.SmallStep
-- END ...
steps :: Expr -> Maybe Expr
steps e =
  if isValue e
    then Just e
    else case step e of
           (Just e') -> steps e'
           Nothing -> Nothing
