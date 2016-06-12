-- BEGIN ...
module Language.BIPL.Domains where

import Data.Map (Map)
-- END ...
-- Results of expression evaluation
type Value = Either Int Bool
-- Stores as maps from variable names to values
type Store = Map String Value
