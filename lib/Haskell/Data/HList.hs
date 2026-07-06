{-# LANGUAGE DataKinds #-}
{-# LANGUAGE GADTs #-}
{-# LANGUAGE KindSignatures #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE IncoherentInstances #-}

module Data.HList (HList, End(..), (:>)(..)) where

import Data.Kind (Type)

infixr 5 :>

data End = End deriving Show
data (:>) h t = (:>) h t deriving Show

class HList a
instance HList End
instance HList t => HList (h :> t)

-- Demo
example :: String :> (Bool :> (Integer :> End))
example = "bike" :> True :> 42 :> End
