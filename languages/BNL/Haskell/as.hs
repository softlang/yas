data Number = Number Bits Rest
data Bits = Single Bit | Many Bit Bits
data Bit = Zero | One
data Rest = Integer | Rational Bits