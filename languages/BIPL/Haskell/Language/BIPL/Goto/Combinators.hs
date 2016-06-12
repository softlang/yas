-- BEGIN ...
-- Continuation-passing style with gotos
module Language.BIPL.Goto.Combinators where

import Language.BIPL.DS.Combinators as DS
import Language.BIPL.DS.Domains
import Language.BIPL.Goto.Domains
import Data.Map (insert)
import Data.Maybe (fromJust)

-- END ...
-- Preserve continuation; declare no gotos
skip' :: StoreTGotosT
skip' (c, g) = (c, [])

-- Update store; declare no gotos
assign' :: String -> StoreO -> StoreTGotosT
assign' x f (c, g) = (\sto -> c (insert x (f sto) sto), [])

-- Compose continuations; add up gotos
seq' :: StoreTGotosT -> StoreTGotosT -> StoreTGotosT
seq' f1 f2 (c, g) =
  let (c', g') = f2 (c, g) in
    let (c'', g'') = f1 (c', g) in
      (c'', g' ++ g'')

-- Select branch; add up gotos
if' :: StoreO -> StoreTGotosT -> StoreTGotosT -> StoreTGotosT
if' f0 f1 f2 (c, g) = 
  let
    (c1, g1) = f1 (c, g)
    (c2, g2) = f2 (c, g)
  in
    (DS.if' f0 c1 c2, g1 ++ g2)

-- Associate label with current continuation
label' :: String -> StoreTGotosT
label' l (c, g) = (c, [(l, c)])

-- Ignore current continuation; return continuation for label
goto' :: String -> StoreTGotosT
goto' l (c, g) = (fromJust (lookup l g), []) 
