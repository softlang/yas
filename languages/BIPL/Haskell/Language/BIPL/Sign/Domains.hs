-- BEGIN ...

-- Abstract domains

module Language.BIPL.Sign.Domains where

import Data.Perhaps.Bool
import Data.Perhaps.Sign
import Data.Perhaps.Either
import Data.Perhaps.Map

-- END ...
-- Results of expression analysis
type AValue = Either' Sign' Bool'

-- Stores as maps from variable ids to values
type AStore = Map' String AValue
