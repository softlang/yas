-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.StrategySchemes where
import Prelude hiding (all, repeat)
import Data.Generics
import Data.Generics.StrategyPrimitives
import Control.Monad
-- END ...
-- Full top-down traversal
fulltd :: Monad m => GenericM m -> GenericM m
fulltd s = s `sequ` all (fulltd s)

-- Full bottom-up traversal
fullbu :: Monad m => GenericM m -> GenericM m
fullbu s = all (fullbu s) `sequ` s

-- Single hit bottom-up traversal
oncebu :: MonadPlus m => GenericM m -> GenericM m
oncebu s = one (oncebu s) `choice` s

-- Top-down traversal with cut-off at successfull subtrees
stoptd :: MonadPlus m => GenericM m -> GenericM m
stoptd s = s `choice` all (stoptd s)

-- Innermost normalization
innermost :: MonadPlus m => GenericM m -> GenericM m
innermost s = repeat (oncebu s)

-- Repeat strategy until it fails
repeat :: MonadPlus m => GenericM m -> GenericM m
repeat s = try (s `sequ` repeat s)

-- Try strategy; behave as identity in case of failure
try :: MonadPlus m => GenericM m -> GenericM m
try s = s `choice` return

-- Try strategy; try additional preprocessor in case of failure
vary :: MonadPlus m => GenericM m -> GenericM m -> GenericM m
vary v s = s `choice` (v `sequ` s)
