isNumber(number(Bits, Rest)) :- isBits(Bits), isRest(Rest).
isBits(single(Bit)) :- isBit(Bit).
isBits(many(Bit, Bits)) :- isBit(Bit), isBits(Bits).
isBit(zero).
isBit(one).
isRest(integer).
isRest(rational(Bits)) :- isBits(Bits).
