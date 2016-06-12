-- BEGIN ...
module Language.BFPL.Domains where

import Data.Map (Map)
-- END ...
-- Results of expression evaluation
type Value = Either Int Bool
-- Environments as maps from argument names to values
type Env = Map String Value
