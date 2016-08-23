-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.StrategyPrimitives where
import Prelude hiding (all, repeat)
import Data.Generics
import Control.Monad
-- END ...
-- Sequential (left-to-right) composition
sequ :: Monad m => GenericM m -> GenericM m -> GenericM m
s1 `sequ` s2 = \x -> s1 x >>=s2

-- Left-biased choice
choice :: MonadPlus m => GenericM m -> GenericM m -> GenericM m
s1 `choice` s2 = \x -> s1 x `mplus` s2 x

-- Transform all immediate children
all :: Monad m => GenericM m -> GenericM m
all = -- ... -- defined in terms of Data.Generics.gfoldl
-- BEGIN ...
  gmapM
-- END ...

-- Transform one immediate child
one :: MonadPlus m => GenericM m -> GenericM m
one = -- ... -- defined in terms of Data.Generics.gfoldl
-- BEGIN ...
  gmapMo
-- END ...
