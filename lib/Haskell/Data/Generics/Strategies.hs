-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.Strategies where
import Prelude hiding (all, repeat)
import Data.Generics
import Control.Monad
fulltd, fullbu :: Monad m => GenericM m -> GenericM m
stoptd, oncetd, oncebu, innermost :: MonadPlus m => GenericM m -> GenericM m
try :: MonadPlus m => GenericM m -> GenericM m
vary :: MonadPlus m => GenericM m -> GenericM m -> GenericM m
repeat :: MonadPlus m => GenericM m -> GenericM m
sequ :: Monad m => GenericM m -> GenericM m -> GenericM m
choice :: MonadPlus m => GenericM m -> GenericM m -> GenericM m
all :: Monad m => GenericM m -> GenericM m
one :: MonadPlus m => GenericM m -> GenericM m
-- END ...
-- Strategic traversal schemes
fulltd s = s `sequ` all (fulltd s)
fullbu s = all (fullbu s) `sequ` s
stoptd s = s `choice` all (stoptd s)
oncetd s = s `choice` one (oncetd s)
oncebu s = one (oncebu s) `choice` s
innermost s = repeat (oncebu s)

-- Basic strategy combinators
s1 `sequ` s2 = \x -> s1 x >>= s2 -- monadic function composition
s1 `choice` s2 = \x -> s1 x `mplus` s2 x -- monadic choice
all s = -- ... -- magically apply s to all immediate subterms
-- BEGIN ...
  gmapM s
-- END ...
one s = -- ... -- magically find first immediate subterm for which s succeeds
-- BEGIN ...
  gmapMo s
-- END ...

-- Helper strategy combinators
try s = s `choice` return -- recover from failure
vary s v = s `choice` (v `sequ` s) -- preprocess term, if necessary 
repeat s = try (s `sequ` repeat s) -- repeat strategy until failure

-- Strategy builders
orFail f = const mzero `extM` f -- fail for all other types
orSucceed f = return `extM` f' -- id for all other types
 where f' x = f x `mplus` return x -- id in case of failure
