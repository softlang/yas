{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeOperators #-}

{-

Well-formedness of DIL MLMs:
* Levels are descending down to zero.
* Each structure name is declared not more than once in a given DIL MLM.
* Each field is defined (introduced) not more than once in any instantiation chain.
* Each field set (assignment) is durability-wise aligned with its definition (introduction).

-}

module Language.DIL.WellFormedness where

import Language.DIL.Syntax
import Data.HList
import GHC.TypeLits (KnownNat, Nat, natVal, type (+), TypeError, ErrorMessage(ShowType, Text, (:<>:)))

-- Start MLM with "mlm $ ..."
-- An MLM is a sequence (hlist) of levels.
-- Each level consists of a level number and a sequence (hlist) of field declarations. 
mlm :: MLM a => a -> a
mlm = id

-- Type checking MLMs
-- Aspects covered:
-- * Descending order of levels
class Levels a => MLM a
instance MLM End
instance SDecls a => MLM ((Level 0, a) :> End)
instance
  ( SDecls a
  , m ~ (n + 1)
  , MLM ((Level (n::Nat), b) :> t)
  ) => MLM ((Level (m::Nat), a) :> (Level (n::Nat), b) :> t)
