-- BEGIN ...
module Language.BNL.Syntax where
-- END ...
data Number = Number Bits Rest
-- BEGIN ...
  deriving Eq
-- END ...
data Bits = Single Bit | Many Bit Bits
-- BEGIN ...
  deriving Eq
-- END ...
data Bit = Zero | One
-- BEGIN ...
  deriving Eq
-- END ...
data Rest = Integer | Rational Bits
-- BEGIN ...
  deriving Eq
-- END ...
-- BEGIN ...
-- Show numbers in concrete syntax
instance Show Bit
 where
  show Zero = "0"
  show One = "1"

instance Show Bits
 where
  show (Single bit) = show bit
  show (Many bit bits) = show bit ++ show bits

instance Show Number 
 where
  show (Number bits rest) = show bits ++ show rest

instance Show Rest 
 where
  show Integer = ""
  show (Rational bits) = "." ++ show bits
-- END ...
