-- BEGIN ...
module Language.BIPL.Rename.Transformation where
import Language.BIPL.Rename.Condition
import Language.BIPL.Syntax
import Data.Generics (everywhere, extT)
import Control.Monad (guard)
-- END ...
rename :: String -> String -> Stmt -> Maybe Stmt
rename i i' x = do
    guard $ pre i i' x
    guard $ post i i' y
    return y
  where
    y = everywhere (id `extT` f `extT` g) x
      where
        f (Assign i'' e) | i'' == i = Assign i' e
        f s = s
        g (Var i'') | i'' == i = Var i'
        g e = e
