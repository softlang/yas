-- BEGIN ...
module Language.BIPL.DS.Combinators where

import Language.BIPL.Syntax (UOp(..), BOp(..))
import Language.BIPL.DS.Domains
import Language.BIPL.Interpreter (uop, bop)
import Data.Map ((!), insert)
import Control.Monad.Fix (fix)
-- END ...
skip' :: StoreT
skip' = id
assign' :: String -> StoreO -> StoreT
assign' x f m = insert x (f m) m
seq' :: StoreT -> StoreT -> StoreT
seq' = flip (.)
if' :: StoreO -> StoreT -> StoreT -> StoreT
if' f g h m = let Right v = f m in if v then g m else h m
while' :: StoreO -> StoreT -> StoreT
while' f g = fix h where h t = if' f (seq' g t) skip'
intconst' :: Int -> StoreO
intconst' i _ = Left i
var' :: String -> StoreO
var' x m = m!x
unary' :: UOp -> StoreO -> StoreO
unary' Negate f m = let Left i = f m in Left (negate i)
unary' Not f m = let Right b = f m in Right (not b)
binary' :: BOp -> StoreO -> StoreO -> StoreO
-- ...
-- BEGIN ...
binary' o f g m = bop o (f m) (g m)
-- END ...
