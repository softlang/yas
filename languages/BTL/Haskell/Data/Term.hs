-- BEGIN ...
module Data.Term where
import Data.TermRep
-- END ...
class Term a where
  explode :: a -> TermRep
  implode :: TermRep -> a
