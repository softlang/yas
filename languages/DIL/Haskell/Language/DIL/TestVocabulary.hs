module Language.DIL.TestVocabulary where

import Language.DIL.Syntax

data ProductType
data Book
data DVD
data MobyDick
data Film2001

data A
data B
data C

data Price
data TaxRate
data Title
data ISBN
data RegionCode

instance Structure ProductType
instance Structure Book
instance Structure DVD
instance Structure MobyDick
instance Structure Film2001

instance Structure A
instance Structure B
instance Structure C

instance Field Price
instance Field TaxRate
instance Field Title
instance Field ISBN
instance Field RegionCode
