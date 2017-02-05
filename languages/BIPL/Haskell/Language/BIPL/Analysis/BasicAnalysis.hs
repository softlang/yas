-- BEGIN ...
{-# LANGUAGE FlexibleContexts #-}
module Language.BIPL.Analysis.BasicAnalysis where
import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Language.BIPL.Analysis.Fix
import Data.CPO
import Data.CPO.Bool
import Data.CPO.Sign
import Data.CPO.Either
import Data.CPO.Map
import Data.Map (Map, empty, fromList, toList, keys, (!), insert)
-- END ...
type Property = Either Sign CpoBool
type VarProperties = Map String Property
algebra :: Alg VarProperties Property
algebra = a where a = Alg {
  skip' = id,
  assign' = \n f m -> insert n (f m) m,
  seq' = flip (.),
  if' = \f g h m ->
    let Right b = f m in
      case b of
        (ProperBool True) -> g m
        (ProperBool False) -> h m
        BottomBool -> bottom
        TopBool -> g m `lub` h m,
  while' = \f g -> fix' (\x -> if' a f (x . g) id) (const bottom),
  intconst' = \i -> const (Left (fromInteger (toInteger i))),
  var' = \n m -> m!n,
  unary' = \o f m ->
    case (o, f m) of
      (Negate, Left s) -> Left (negate s)
      (Not, Right b) -> Right (cpoNot b),  
  binary' = \o f g m -> -- ...
-- BEGIN ...
    case (o, f m, g m) of
      (Add, Left i1, Left i2) -> Left (i1+i2)
      (Sub, Left i1, Left i2) -> Left (i1-i2)
      (Mul, Left i1, Left i2) -> Left (i1*i2)
      (Leq, Left i1, Left i2) -> Right (leqSign i1 i2)
      (Geq, Left i1, Left i2) -> Right (geqSign i1 i2)
-- END ...
}
