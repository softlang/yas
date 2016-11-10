-- BEGIN ...
module Data.Term where
import Data.TermRep
-- END ...
class Term a where
  toTermRep :: a -> TermRep
  fromTermRep :: TermRep -> a
