symbol number: bits # rest -> number ; // A binary number
symbol single: bit -> bits ; // A single bit
symbol many: bit # bits -> bits ; // More than one bit
symbol zero: -> bit ; // The zero bit
symbol one: -> bit ; // The nonzero bit
symbol integer: -> rest ; // An integer number
symbol rational: bits -> rest ; // A rational number
