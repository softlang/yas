-- BEGIN ...
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeSynonymInstances #-}
{-# LANGUAGE FlexibleInstances #-}
module Language.URAL.Conformance where
import Language.URAL.Syntax
import Language.URAL.Meta.Syntax
import Data.Conformance
-- END ...
-- Conformance of URAs to metamodels
instance Conformance URA MM where
  conformsTo = many

-- Closure of stepwise conformance
many :: URA -> MM -> Bool
many [] _ = True
many (a:as) m
  | Just s <- step a m
  = many as m { stype = s }
many _ _ = False

-- Stepwise conformance
step :: Axis -> MM -> Maybe SType
-- Index (subscript) a container
step (Index i) m@(MM _ _ (ListType s c))
  | i >= 0
  , (c /= Optional || i == 0)
  = Just s
step (Index i) m@(MM _ _ (ProductType ss))
  | i >= 0
  , i < length ss
  = Just (ss!!i)
-- Dereference concrete type
step (Tag t) m@(MM _ _ (NominalType t'))
  | t == t'
  , Just (CType _ s) <- getCType m t
  = Just s
-- Dereference concrete type with abstract type at hand
step r@(Tag t) m@(MM _ _ (NominalType t'))
  | t /= t'
  , Just (AType _ ts) <- getAType m t'
  , elem t ts
  = step r m { stype = NominalType t }
-- Safe-guarded selector-based lookup on record types
step (Selector sel) m@(MM _ _ (RecordType selss))
  | [s] <- [ s | (sel', s) <- selss, sel' == sel ]
  = Just s
step _ m@(MM _ _ s@AnyType) = Just s
-- Failure of conformance
step _ _ = Nothing
