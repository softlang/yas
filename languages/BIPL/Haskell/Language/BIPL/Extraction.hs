-- BEGIN ...
module Language.BIPL.Extraction where
import Language.BIPL.Syntax
import Data.Map (Map, insertWith, empty)
import Data.Generics (toConstr, showConstr, mkQ, everything)
-- END ...
ops :: Stmt -> Map String Int
ops s = foldr (\o m -> insertWith (+) o 1 m) empty os
  where
    os = everything (++) ([] `mkQ` f) s
    f (Unary o _) = [showConstr (toConstr o)]
    f (Binary o _ _) = [showConstr (toConstr o)]
    f _ = []
