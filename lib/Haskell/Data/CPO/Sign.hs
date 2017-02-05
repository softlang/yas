-- BEGIN ...
module Data.CPO.Sign where
import Data.CPO
import Data.CPO.Bool
-- END ...
data Sign = Zero | Pos | Neg | BottomSign | TopSign
-- BEGIN ...
  deriving (Eq, Show)
-- END ...

instance Num Sign
 where
  fromInteger n
    | n  > 0    = Pos
    | n  < 0    = Neg
    | otherwise = Zero

  TopSign + _ = TopSign
  _ + TopSign = TopSign
  BottomSign + _ = BottomSign
  _ + BottomSign = BottomSign
  Zero + Zero = Zero
  Zero + Pos = Pos
  -- ...
-- BEGIN ...
  Zero + Neg = Neg
  Pos + Zero = Pos
  Pos + Pos = Pos
  Pos + Neg = TopSign
  Neg + Zero = Neg
  Neg + Pos = TopSign
  Neg + Neg = Neg

  TopSign - _ = TopSign
  _ - TopSign = TopSign
  BottomSign - _ = BottomSign
  _ - BottomSign = BottomSign
  Zero - Zero = Zero
  Zero - Pos = Neg
  Zero - Neg = Pos
  Pos - Zero = Pos
  Pos - Pos = TopSign
  Pos - Neg = Pos
  Neg - Zero = Neg
  Neg - Pos = Neg
  Neg - Neg = TopSign

  TopSign * _ = TopSign
  _ * TopSign = TopSign
  Zero * _ = Zero
  _ * Zero = Zero
  Pos * Pos = Pos
  Neg * Neg = Pos
  Pos * Neg = Neg
  Neg * Pos = Neg
  BottomSign * _ = BottomSign
  _ * BottomSign = BottomSign

  signum = id

  abs TopSign = TopSign
  abs BottomSign = BottomSign
  abs Zero = Zero
  abs Pos = Pos
  abs Neg = Pos

-- Abstraction-based greater-equal on signs
geqSign :: Sign -> Sign -> CpoBool
geqSign Zero Zero = ProperBool True
geqSign Zero Neg = ProperBool True
geqSign Pos Zero = ProperBool True
geqSign Pos Pos = TopBool
geqSign Pos Neg = ProperBool True
geqSign Neg Neg = TopBool
geqSign TopSign _ = TopBool
geqSign _ TopSign = TopBool
geqSign BottomSign _ = BottomBool
geqSign _ BottomSign = BottomBool
geqSign _ _ = ProperBool False

-- Abstraction-based equality on signs
eqSign :: Sign -> Sign -> CpoBool
eqSign TopSign _ = TopBool
eqSign _ TopSign = TopBool
eqSign BottomSign _ = BottomBool
eqSign _ BottomSign = BottomBool
eqSign Pos Pos = TopBool
eqSign Neg Neg = TopBool
eqSign Zero Zero = ProperBool True
eqSign _ _ = ProperBool False

-- Abstraction-based less-equal on signs
leqSign :: Sign -> Sign -> CpoBool
leqSign TopSign _ = TopBool
leqSign _ TopSign = TopBool
leqSign BottomSign _ = BottomBool
leqSign _ BottomSign = BottomBool
leqSign Pos Pos = TopBool
leqSign Neg Neg = TopBool
leqSign Pos Zero = ProperBool False
leqSign Pos Neg = ProperBool False
leqSign Zero Neg = ProperBool False
leqSign _ _ = ProperBool True
-- END ...

instance CPO Sign where
  pord x y | x == y = True
  pord BottomSign _ = True
  pord _ TopSign = True
  pord _ _ = False
  lub x y | x == y = x
  lub BottomSign x = x
  lub x BottomSign = x
  lub _ _ = TopSign

instance Bottom Sign where
  bottom = BottomSign
