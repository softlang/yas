-- BEGIN ...
-- The standard access semantics of URAL
module Language.URAL.Semantics where
import Language.URAL.Syntax
import Language.URAL.Repr.Syntax
-- END ...
-- Evaluation of URAs on representations
evaluate :: URA -> Repr -> Maybe Repr
evaluate = many

-- Closure of stepwise evaluation
many :: URA -> Repr -> Maybe Repr
many [] r = Just r
many (a:as) r
  | Just r' <- step a r
  = many as r'
many _ _ = Nothing

-- Stepwise evaluation
step :: Axis -> Repr -> Maybe Repr
step (Index i) (List rs)
  | i >= 0
  , i < length rs
  = Just (rs!!i)
step (Tag t) (Tagged t' r)
  | t == t'
  = Just r
step (Selector sel) (Record selrs)
  | [r] <- [ r | (sel', r) <- selrs, sel' == sel ]
  = Just r
step _ _ = Nothing
