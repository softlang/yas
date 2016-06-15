-- BEGIN ...
{-# LANGUAGE FlexibleContexts #-}

-- An algebra for sign detection

module Language.BIPL.Sign.V2.Analysis where

import Language.BIPL.Algebra.Signature
import Language.BIPL.Syntax (UOp(..), BOp(..))
import Language.BIPL.Sign.Domains
import Language.BIPL.Sign.Fix
import Data.Perhaps
import Data.Perhaps.Bool
import Data.Perhaps.Sign
import Data.Perhaps.Either
import Data.Perhaps.Map
import Data.Perhaps.Finiteness
import Data.Perhaps.Bottomness
import Data.Monoid (mconcat)

-- END ...
analysis :: Alg AStore AValue
analysis = Alg {
  -- ...
-- BEGIN ...
  skip' = id,
  assign' = \n f sto -> insert' n (f sto) sto,
  seq' = flip (.),
-- END ...
  if' = \f g h sto ->
    let (Between (Right b)) = f sto in
      case b of
        (Between True) -> g sto
        (Between False) -> h sto
        Bottom -> toBottom sto
        Top -> g (feasible True f sto) `lub` h (feasible False f sto)
          where
            -- Constrain mapping w.r.t. condition result
            feasible v f sto =
              mconcat [ sto' | sto' <- maps (keys' sto)
                             , sto' `pord` sto
                             , Between (Right (Between v)) `pord` f sto'
                      ],
  while' = \f g sto ->
    fix' (\x -> if' analysis f (x . g) id) (const Bottom) sto,
  -- ...
-- BEGIN ...
  intConst' = \i ->
    const (Between (Left (fromInteger (toInteger i)))),
  var' = \n sto -> lookup' sto n,
  unary' = \o f sto ->
    case (o, f sto) of
      (Negate, Between (Left s)) -> Between (Left (negate s))
      (Not, Between (Right b)) -> Between (Right (not' b)),  
  binary' = \o f g sto ->
    case (o, f sto, g sto) of
      (Add, Between (Left i1), Between (Left i2)) ->
        Between (Left (i1+i2))
      (Sub, Between (Left i1), Between (Left i2)) ->
        Between (Left (i1-i2))
      (Mul, Between (Left i1), Between (Left i2)) ->
        Between (Left (i1*i2))
      (Leq, Between (Left i1), Between (Left i2)) ->
        Between (Right (leqSign i1 i2))
      (Geq, Between (Left i1), Between (Left i2)) ->
        Between (Right (geqSign i1 i2))
-- END ...
}
