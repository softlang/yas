-- BEGIN ...
-- Abstract sums on abstract operands
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}
module Data.Perhaps.Either where

import Data.Perhaps
import Data.Perhaps.Utilities

-- END ...
type Either' x y = Perhaps (Either x y)

instance (POrd x, POrd y) => POrd (Either (Perhaps x) (Perhaps y)) where

  pord = mkPord f 
    where f x y = case (x, y) of
                    (Left l1, Left l2) -> pord l1 l2
                    (Right r1, Right r2) -> pord r1 r2
                    _ -> False
  lub = mkLub f
    where f x y = case (x, y) of
                    (Left l1, Left l2) -> Between (Left (lub l1 l2))
                    (Right r1, Right r2) -> Between (Right (lub r1 r2))
                    _ -> Top
