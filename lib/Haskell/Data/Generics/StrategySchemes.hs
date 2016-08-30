-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.StrategySchemes where
import Prelude hiding (all, repeat)
import Data.Generics
import Data.Generics.StrategyBasics
import Control.Monad
fulltd, fullbu :: Monad m => GenericM m -> GenericM m
stoptd, oncetd, oncebu, innermost :: MonadPlus m => GenericM m -> GenericM m
-- END ...
fulltd s = s `sequ` all (fulltd s)
fullbu s = all (fullbu s) `sequ` s
stoptd s = s `choice` all (stoptd s)
oncetd s = s `choice` one (oncetd s)
oncebu s = one (oncebu s) `choice` s
innermost s = repeat (oncebu s)
