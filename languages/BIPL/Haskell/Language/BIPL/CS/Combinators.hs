-- BEGIN ...
module Language.BIPL.CS.Combinators where

import qualified Language.BIPL.DS.Combinators as DS
import Language.BIPL.DS.Domains
import Language.BIPL.CS.Domains
import Data.Map (insert)
import Control.Monad.Fix (fix)
-- END ...
-- The identity function for type StoreT
skip' :: StoreTT
skip' = id

-- Pointwise store update
assign' :: String -> StoreO -> StoreTT
assign' x f c sto = c (insert x (f sto) sto)

-- Function composition for type StoreTT
seq' :: StoreTT -> StoreTT -> StoreTT
seq' = (.)

-- Select branch
if' :: StoreO -> StoreTT -> StoreTT -> StoreTT
if' f g h c = DS.if' f (g c) (h c)

-- Fixed point semantics of loops
while' :: StoreO -> StoreTT -> StoreTT
while' f g c = fix h c
  where
    h t = if' f (seq' g t) skip'
