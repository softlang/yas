-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.StrategyBasics where
import Prelude hiding (all, repeat)
import Data.Generics
import Control.Monad
-- END ...
type Strategy m = forall a. Data a => a -> m a

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

-- Repeat strategy until it fails
repeat :: MonadPlus m => GenericM m -> GenericM m
repeat s = try (s `sequ` repeat s)

-- Try strategy; behave as identity in case of failure
try :: MonadPlus m => GenericM m -> GenericM m
try s = s `choice` return

-- Try strategy; try additional preprocessor in case of failure
vary :: MonadPlus m => GenericM m -> GenericM m -> GenericM m
vary v s = s `choice` (v `sequ` s)
