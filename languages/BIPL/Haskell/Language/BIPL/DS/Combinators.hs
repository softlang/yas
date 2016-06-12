-- BEGIN ...
module Language.BIPL.DS.Combinators where

import Language.BIPL.DS.Domains
import Data.Map (insert)
import Control.Monad.Fix (fix)
-- END ...
-- The identity function for type Store
skip' :: StoreT
skip' = id

-- Pointwise store update
assign' :: String -> StoreO -> StoreT
assign' x f s = insert x (f s) s

-- Function composition for type StoreT
seq' :: StoreT -> StoreT -> StoreT
seq' = flip (.)

-- Select branch
if' :: StoreO -> StoreT -> StoreT -> StoreT
if' f g h sto =
   let (Right v) = f sto in 
      if v then g sto else h sto

-- Fixed point semantics of loops
while' :: StoreO -> StoreT -> StoreT
while' f g = fix h
  where
    h t = if' f (seq' g t) skip'
