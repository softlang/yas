-- BEGIN ...
-- A monadic algebra for standard interpretation
module Language.BIPL.MonadicAlgebra.Interpretation where
import Prelude hiding (lookup)
import Language.BIPL.MonadicAlgebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Data.Map (Map, lookup, insert)
import Control.Monad ((<=<), MonadPlus, mzero)
import Control.Monad.Fix (fix)
-- END ...
type Value = Either Int Bool
type Store = Map String Value
interpretation :: MonadPlus m => Alg m Store Value
interpretation = Alg {
  skip' = return,
  assign' = \n f sto -> f sto >>= \v -> return (insert n v sto),
  seq' = flip (<=<),
-- BEGIN ...
  if' = \f g h sto -> f sto >>= \v ->
    case v of { (Right b) -> if b then g sto else h sto; _ -> mzero },
  while' = \f g ->
    fix (\x -> if' interpretation f
                  (seq' interpretation g x)
                  (skip' interpretation)),
  intconst' = \i -> const (return (Left i)),
  var' = \n sto -> maybe mzero return (lookup n sto),
  unary' = \o f sto -> f sto >>= \v ->
    case (o, v) of
      (Negate, Left i) -> return (Left (negate i))
      (Not, Right b) -> return (Right (not b))
      _ -> mzero,
  binary' = \o f g sto -> -- ...
    f sto >>= \v1 -> g sto >>= \v2 ->
    case (o, v1, v2) of
      (Add, Left i1, Left i2) -> return (Left (i1+i2))
      (Sub, Left i1, Left i2) -> return (Left (i1-i2))
      (Mul, Left i1, Left i2) -> return (Left (i1*i2))
      (Geq, Left i1, Left i2) -> return (Right (i1>=i2))
      _ -> mzero
-- END ...
}
