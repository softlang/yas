-- BEGIN ...
-- The syntax of URAL
module Language.URAL.Syntax where
-- END ...
-- Accessors as sequences of parts
type URA = [Axis]

-- Accessor axes
data Axis
   -- Index (subscript) in a list
   = Index Index
   -- Tag of a type
   | Tag Tag
   -- Selector of a record
   | Selector Selector
-- BEGIN ...
   deriving (Eq, Show, Read)
-- END ...

-- Helper types for axes
type Index = Int
type Tag = String
type Selector = String
