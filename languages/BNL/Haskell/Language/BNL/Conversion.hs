-- BEGIN ...
module Language.BNL.Conversion where
import Language.BNL.Syntax
-- END ...
number :: Number -> Float
number (Number bs r) = val0
  where
    (len1, val1) = bits bs pos1
    pos1 = len1 - 1
    val2 = rest r
    val0 = val1 + val2

bits :: Bits -> Int -> (Int, Float)
bits (Single b) pos = (1, bit b pos)
bits (Many b bs) pos0 = (len0, val0)
  where
    val1 = bit b pos0
    (len1, val2) = bits bs pos1
    pos1 = pos0 - 1
    len0 = len1 + 1
    val0 = val1 + val2

bit :: Bit -> Int -> Float
bit Zero _pos = 0 
bit One pos = 2^^pos

rest :: Rest -> Float
rest Integer = 0
rest (Rational bs) = val
  where
    (_len, val) = bits bs pos
    pos = -1
