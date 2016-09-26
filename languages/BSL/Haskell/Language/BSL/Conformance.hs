-- BEGIN ...
module Language.BSL.Conformance where
import Language.BSL.Syntax
import Data.TermRep
-- END ...
termOfSort :: [Profile] -> TermRep -> Sort -> Bool
termOfSort ps (TermRep c ts) s =
  case [ ss | (c', ss, s') <- ps, c==c', s==s' ] of
   [ss] -> and (map (uncurry (termOfSort ps)) (zip ts ss))
   _ -> False
