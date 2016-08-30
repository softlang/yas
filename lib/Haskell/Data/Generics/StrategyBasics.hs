-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.StrategyBasics where
import Prelude hiding (all, repeat)
import Data.Generics
import Control.Monad
orId :: (Monad m, Data a) => (a -> m a) -> GenericM m
orSucceed :: (MonadPlus m, Data a) => (a -> m a) -> GenericM m
orFail :: (MonadPlus m, Data a) => (a -> m a) -> GenericM m
all :: Monad m => GenericM m -> GenericM m
one :: MonadPlus m => GenericM m -> GenericM m
sequ :: Monad m => GenericM m -> GenericM m -> GenericM m
choice :: MonadPlus m => GenericM m -> GenericM m -> GenericM m
try :: MonadPlus m => GenericM m -> GenericM m
repeat :: MonadPlus m => GenericM m -> GenericM m
-- END ...
-- Construct (generic) strategies from (monomorphic) functions
orId f = return `extM` f
orSucceed f = return `extM` (\x -> f x `mplus` return x)
orFail f = const mzero `extM` f
-- Composition of strategies
s1 `sequ` s2 = \x -> s1 x >>= s2
s1 `choice` s2 = \x -> s1 x `mplus` s2 x
try s = s `choice` return
repeat s = try (s `sequ` repeat s)
-- One-layer traversal
all = -- ... -- defined in terms of the Data class
-- BEGIN ...
  gmapM
-- END ...
one = -- ... -- defined in terms of the Data class
-- BEGIN ...
  gmapMo
-- END ...
