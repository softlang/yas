-- BEGIN ...
module Language.BIPL.Goto.Domains where

import Language.BIPL.DS.Domains
-- END ...
type Gotos = [(String, StoreT)] -- Goto tables
type StoreTT' = (StoreT, Gotos) -> (StoreT, Gotos) -- Transformation with gotos
