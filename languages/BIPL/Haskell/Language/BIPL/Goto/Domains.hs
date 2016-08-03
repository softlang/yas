-- BEGIN ...
module Language.BIPL.Goto.Domains where

import Language.BIPL.DS.Domains
-- END ...
-- Goto tables as mappings from labels to continuations
type Gotos = [(String, StoreT)]
-- Store-transformer-and-gotos transformers 
type StoreTGotosT = (StoreT, Gotos) -> (StoreT, Gotos)
