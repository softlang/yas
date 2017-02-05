-- BEGIN ...
module Data.CPO.Bool where
import Data.CPO
-- END ...
data CpoBool = ProperBool Bool | BottomBool | TopBool
-- BEGIN ...
  deriving (Eq, Show)
-- END ...
instance CPO CpoBool where
  pord x y | x == y = True
  pord BottomBool _ = True
  pord _ TopBool = True
  pord _ _ = False
  lub x y | x == y = x
  lub BottomBool x = x
  lub x BottomBool = x
  lub _ _ = TopBool
instance Bottom CpoBool where
  bottom = BottomBool

cpoNot :: CpoBool -> CpoBool
cpoNot TopBool = TopBool
cpoNot BottomBool = BottomBool
cpoNot (ProperBool b) = ProperBool (not b)

cpoAnd :: CpoBool -> CpoBool -> CpoBool
cpoAnd TopBool _ = TopBool
cpoAnd _ TopBool = TopBool
cpoAnd BottomBool _ = BottomBool
cpoAnd _ BottomBool = BottomBool
cpoAnd (ProperBool b1) (ProperBool b2) = ProperBool (b1 && b2)
