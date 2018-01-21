-- BEGIN ...
module Language.URAL.Completion where
import Language.URAL.Repr.Syntax
import Language.URAL.Syntax
-- END ...
-- Map representations to axis options
next :: Repr -> [Axis]
next (String _) = []
next (List rs) = map Index [0..length rs - 1]
next (Tagged t r) = [Tag t]
next (Record selrs) = map (Selector . fst) selrs
