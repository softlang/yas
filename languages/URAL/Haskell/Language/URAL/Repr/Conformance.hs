-- BEGIN ...
{-# LANGUAGE MultiParamTypeClasses #-}
module Language.URAL.Repr.Conformance where
import Language.URAL.Repr.Syntax
import Language.URAL.Meta.Syntax
import Data.Conformance
-- END ...
-- Conformance of representations to metamodels
instance Conformance Repr MM where
  conformsTo (String _) (MM _ _ StringType) = True
  conformsTo (List rs) m@(MM _ _ (ListType s c))
    | (c /= Optional || length rs <= 1)
    , (c /= Plus || length rs > 0) 
    = and (map (\r -> conformsTo r m { stype = s }) rs)
  conformsTo (List rs) m@(MM _ _ (ProductType ss))
    | length rs == length ss
    = and (map (\(r, s) -> conformsTo r m { stype = s }) rss)
    where rss = zip rs ss
  conformsTo (Tagged t r) m@(MM _ _ (NominalType t'))
    | t == t'
    , Just (CType _ s) <- getCType m t
    = conformsTo r m { stype = s }  
  conformsTo r@(Tagged t _) m@(MM _ _ (NominalType t'))
    | t /= t'
    , Just (AType _ ts) <- getAType m t'
    , elem t ts
    = conformsTo r m { stype = NominalType t }
  conformsTo (Record selrs) m@(MM _ _ (RecordType selss))
    | length selrs == length selss
    , map fst selrs == map fst selss
    = and (map (\(r, s) -> conformsTo r m { stype = s }) rss)
    where rss = zip (map snd selrs) (map snd selss)
  conformsTo _ m@(MM _ _ AnyType) = True
  conformsTo _ _ = False
