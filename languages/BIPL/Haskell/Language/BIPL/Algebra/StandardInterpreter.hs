-- BEGIN ...
-- An algebra for standard interpretation
module Language.BIPL.Algebra.StandardInterpreter where
import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Data.Map (Map, (!), insert)
import Control.Monad.Fix (fix)
-- END ...
type Value = Either Int Bool
type Store = Map String Value
algebra :: Alg Store Value
algebra = a where a = Alg {
  skip' = id,
  assign' = \n f m -> insert n (f m) m,
  seq' = flip (.),
  if' = \f g h m -> let (Right b) = f m in if b then g m else h m,
  while' = \f g -> fix (\x -> if' a f (seq' a g x) (skip' a)),
  intconst' = \i -> const (Left i),
  var' = \n m -> m!n,
  unary' = \o f m ->
    case (o, f m) of
      (Negate, Left i) -> Left (negate i)
      (Not, Right b) -> Right (not b),
  binary' = \o f g m -> -- ...
-- BEGIN ...
    case (o, f m, g m) of
      (Add, Left i1, Left i2) -> Left (i1+i2)
      (Sub, Left i1, Left i2) -> Left (i1-i2)
      (Mul, Left i1, Left i2) -> Left (i1*i2)
      (Geq, Left i1, Left i2) -> Right (i1>=i2)
-- END ...
}
