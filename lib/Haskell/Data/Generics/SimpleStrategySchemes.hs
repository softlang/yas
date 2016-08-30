-- BEGIN ...
{-# LANGUAGE RankNTypes #-}
module Data.Generics.SimpleStrategySchemes where
import Prelude hiding (all, repeat)
import Data.Generics
import Data.Generics.StrategyBasics
import qualified Data.Generics.StrategySchemes as Poly
import Control.Monad
fulltd, fullbu :: (Monad m, Data a) => (a -> m a) -> GenericM m
stoptd, oncetd, oncebu, innermost :: (MonadPlus m, Data a) => (a -> m a) -> GenericM m
-- END ...
fulltd s = Poly.fulltd (orId s)
fullbu s = Poly.fullbu (orId s)
stoptd s = Poly.stoptd (orFail s)
oncetd s = Poly.oncetd (orFail s)
oncebu s = Poly.oncebu (orFail s)
innermost s = Poly.innermost (orFail s)
