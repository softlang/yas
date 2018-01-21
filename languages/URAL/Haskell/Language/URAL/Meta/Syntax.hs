-- BEGIN ...
{-# LANGUAGE DeriveDataTypeable #-}
module Language.URAL.Meta.Syntax where
import Language.URAL.Syntax (Tag, Selector)
import Data.Maybe (isNothing)
import Data.Typeable
import Data.Data
-- END ...
-- Metamodels for URAL views on representations
data MM = MM { atypes :: [AType], ctypes :: [CType], stype :: SType }
-- BEGIN ...
   deriving (Eq, Show, Read, Data, Typeable)
-- END ...

-- Abstract nominal types
data AType = AType { atag :: Tag, ctags :: [Tag] }
-- BEGIN ...
   deriving (Eq, Show, Read, Data, Typeable)
-- END ...

-- Concrete nominal types
data CType = CType { ctag :: Tag, sameas :: SType }
-- BEGIN ...
   deriving (Eq, Show, Read, Data, Typeable)
-- END ...

-- Structural types
data SType
   -- Strings as base case
   = StringType
   -- Options and lists
   | ListType SType Cardinality
   -- Products (sequential composition)
   | ProductType [SType]
   -- Type reference
   | NominalType Tag
   -- Records of labeled components
   | RecordType [(Selector, SType)]
   -- The end of metamodeled representation
   | AnyType
-- BEGIN ...
   deriving (Eq, Show, Read, Data, Typeable)
-- END ...

-- Cardinalities
data Cardinality = Optional | Star | Plus
-- BEGIN ...
   deriving (Eq, Show, Read, Data, Typeable)
-- END ...

-- Look up abstract type by name
getAType :: MM -> Tag -> Maybe AType
getAType (MM as _ _) n
  = case [ a | a@(AType n' _) <- as, n' == n ] of
      [a] -> Just a
      _ -> Nothing

-- Look up concrete type by name
getCType :: MM -> Tag -> Maybe CType
getCType (MM _ cs _) n
  = case [ c | c@(CType n' _) <- cs, n' == n ] of
      [c] -> Just c
      _ -> Nothing
