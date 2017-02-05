-- BEGIN ...
{-# LANGUAGE FlexibleContexts #-}
module Language.BIPL.Analysis.RefinedAnalysis where
import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Language.BIPL.Analysis.Fix
import Data.CPO
import Data.CPO.Bool
import Data.CPO.Sign
import Data.CPO.Either
import Data.CPO.Map
import Data.Map (Map, empty, fromList, toList, keys, (!), insert)
type Property = Either Sign CpoBool
type VarProperties = Map String Property
-- END ...
algebra :: Alg VarProperties Property
algebra = a where a = Alg {
  -- ...
-- BEGIN ...
  skip' = id,
  assign' = \x f m -> insert x (f m) m,
  seq' = flip (.),
-- END ...
  if' = \f g h m ->
    let Right b = f m in
      case b of
        (ProperBool True) -> g m
        (ProperBool False) -> h m
        BottomBool -> bottoms m
        TopBool -> g (feasible True f m) `lub` h (feasible False f m)
          where feasible b f m = lublist (bottoms m) [ m' |
                  m' <- maps (keys m),
                  m' `pord` m,
                  Right (ProperBool b) `pord` f m' ],
  -- ...
-- BEGIN ...
  while' = \f g -> fix' (\x -> if' a f (x . g) id) (const bottom),
  intconst' = \i -> const (Left (fromInteger (toInteger i))),
  var' = \x m -> m!x,
  unary' = \o f m ->
    case (o, f m) of
      (Negate, Left s) -> Left (negate s)
      (Not, Right b) -> Right (cpoNot b),  
  binary' = \o f g m ->
    case (o, f m, g m) of
      (Add, Left i1, Left i2) -> Left (i1+i2)
      (Sub, Left i1, Left i2) -> Left (i1-i2)
      (Mul, Left i1, Left i2) -> Left (i1*i2)
      (Leq, Left i1, Left i2) -> Right (leqSign i1 i2)
      (Geq, Left i1, Left i2) -> Right (geqSign i1 i2)
-- END ...
}
-- BEGIN ...
-- Enumerate all maps for given keys
maps :: [String] -> [VarProperties]
maps = foldr f [empty]
  where
    f k ms = concat (map g properties)
      where
        properties = map Left [Zero, Pos, Neg] ++ map (Right . ProperBool) [True, False]
        g v = map (insert k v) ms

-- Turn properties to bottom
bottoms :: VarProperties -> VarProperties
bottoms = fromList . map f . toList
  where
    f (x, Left _) = (x, Left bottom)
    f (x, Right _) = (x, Right bottom)
-- END ...
