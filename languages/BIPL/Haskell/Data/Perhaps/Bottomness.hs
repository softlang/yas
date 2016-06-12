-- BEGIN ...
{-# LANGUAGE TypeSynonymInstances, FlexibleInstances #-}

-- Return bottom modulo special cases

module Data.Perhaps.Bottomness where

import Data.Perhaps
import Data.Perhaps.Bool
import Data.Perhaps.Sign
import Data.Perhaps.Either
import Data.Perhaps.Map
import Data.Map (toList, fromList)

-- END ...
class ToBottom a where toBottom :: a -> a
instance ToBottom Bool' where toBottom = const Bottom
instance ToBottom Sign' where toBottom = const Bottom
-- Preserve commitment to sum's operand
instance (ToBottom a, ToBottom b) => ToBottom (Either' a b) where
  toBottom (Between (Left x)) = Between (Left (toBottom x))
  toBottom (Between (Right y)) = Between (Right (toBottom y))
  toBottom _ = Bottom
-- Preserve domain of map
instance (Ord k, ToBottom v) => ToBottom (Map' k v) where
  toBottom (Between m) = Between (fromList (map f (toList m)))
    where f (k,v) = (k,toBottom v)
  toBottom _ = Bottom
