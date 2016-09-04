-- BEGIN ...
module Language.BIPL.Rename.Condition (pre, post) where
import Language.BIPL.Syntax
import Data.Generics (Data, everything, extQ)
import Data.List (nub)
-- END ...
pre, post :: String -> String -> Stmt -> Bool
pre i i' x = elem i (vars x) && not (elem i' (vars x))
post i i' y = not (elem i (vars y)) && elem i' (vars y)
vars :: Data a => a -> [String]
vars z = nub (everything (++) (const [] `extQ` f `extQ` g) z)
  where
    f (Assign i _) = [i]
    f _ = []
    g (Var i) = [i]
    g _ = []
