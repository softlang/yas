module Language.ULL.DS.Combinators where

import Prelude hiding (lookup, succ, pred)
import Control.Monad.Fix (mfix)
import Data.Map (lookup, insert)
import Language.ULL.DS.Domains

-- Variables
var :: String -> Meaning
var x env =
  lookup x env

-- Abstraction:
-- The current environment is captured when the lambda is interpreted.
-- Applying the resulting semantic function extends that captured
-- environment with the formal argument.
lambda :: String -> Meaning -> Meaning
lambda x body env =
  Just (VFun (\v -> body (insert x v env)))

-- Application
apply :: Meaning -> Meaning -> Meaning
apply m1 m2 env = do
  v1 <- m1 env
  v2 <- m2 env
  case v1 of
    VFun f -> f v2
    _      -> Nothing

-- Boolean constants
true :: Meaning
true _ =
  Just (VBool True)

false :: Meaning
false _ =
  Just (VBool False)

-- Natural-number constant
zero :: Meaning
zero _ =
  Just (VNat 0)

-- Successor
succ :: Meaning -> Meaning
succ m env = do
  v <- m env
  case v of
    VNat n -> Just (VNat (n + 1))
    _      -> Nothing

-- Predecessor
pred :: Meaning -> Meaning
pred m env = do
  v <- m env
  case v of
    VNat 0 -> Just (VNat 0)
    VNat n -> Just (VNat (n - 1))
    _      -> Nothing

-- Zero test
isZero :: Meaning -> Meaning
isZero m env = do
  v <- m env
  case v of
    VNat 0 -> Just (VBool True)
    VNat _ -> Just (VBool False)
    _      -> Nothing

-- Conditional
ifThenElse :: Meaning -> Meaning -> Meaning -> Meaning
ifThenElse m0 m1 m2 env = do
  v0 <- m0 env
  case v0 of
    VBool True  -> m1 env
    VBool False -> m2 env
    _           -> Nothing

-- Fixed point
fix :: Meaning -> Meaning
fix m env = do
  v <- m env
  case v of
    VFun f -> mfix f
    _      -> Nothing
