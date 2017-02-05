-- BEGIN ...
-- Continuation-passing style with gotos
module Language.BIPL.Goto.Combinators where
import Language.BIPL.DS.Combinators as DS
import Language.BIPL.DS.Domains
import Language.BIPL.Goto.Domains
import Data.Map (insert)
import Data.Maybe (fromJust)
-- END ...
skip' :: StoreTT'
skip' (c, t) = (c, [])
assign' :: String -> StoreO -> StoreTT'
assign' x f (c, t) = (\m -> c (insert x (f m) m), [])
seq' :: StoreTT' -> StoreTT' -> StoreTT'
seq' f g (c, t) = let (c', t') = g (c, t) in let (c'', t'') = f (c', t) in (c'', t'++t'')
if' :: StoreO -> StoreTT' -> StoreTT' -> StoreTT'
if' f g h (c, t) = let ((c1, t1), (c2, t2)) = (g (c, t), h (c, t)) in (DS.if' f c1 c2, t1++t2)
label' :: String -> StoreTT'
label' l (c, t) = (c, [(l, c)])
goto' :: String -> StoreTT'
goto' l (c, t) = (fromJust (lookup l t), []) 
