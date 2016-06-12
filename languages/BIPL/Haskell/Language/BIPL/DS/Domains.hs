-- BEGIN ...
module Language.BIPL.DS.Domains where

import Data.Map (Map)
-- END ...
-- Results of expression evaluation
type Value = Either Int Bool
-- Stores as maps from variable ids to values
type Store = Map String Value
-- Store transformers (semantics of statements)
type StoreT = Store -> Store
-- Store observers (semantics of expressions)
type StoreO = Store -> Value
