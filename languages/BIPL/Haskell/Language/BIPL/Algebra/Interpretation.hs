-- BEGIN ...
-- An algebra for standard interpretation
module Language.BIPL.Algebra.Interpretation where

import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Data.Map (Map, (!), insert)
import Control.Monad.Fix

-- END ...
-- Results of expression evaluation
type Value = Either Int Bool

-- Stores as maps from variable ids to values
type Store = Map String Value

-- The operations for standard interpretation
interpretation :: Alg Store Value
interpretation = Alg {
  skip' = id,
  assign' = \n f sto -> insert n (f sto) sto,
  seq' = flip (.),
  if' = \f g h sto ->
    let (Right b) = f sto in
      if b then g sto else h sto,
  while' = \f g ->
    fix (\x -> if' interpretation f (x . g) id),
  intConst' = \i -> const (Left i),
  var' = \n sto -> sto!n,
  unary' = \o f sto ->
    case (o, f sto) of
      (Negate, Left i) -> Left (negate i)
      (Not, Right b) -> Right (not b),
  binary' = \o f g sto ->
      -- ...
-- BEGIN ...
    case (o, f sto, g sto) of
      (Add, Left i1, Left i2) -> Left (i1+i2)
      (Sub, Left i1, Left i2) -> Left (i1-i2)
      (Mul, Left i1, Left i2) -> Left (i1*i2)
      (Geq, Left i1, Left i2) -> Right (i1>=i2)
-- END ...
}
