# File _languages/BNL/as.bsl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/as.bsl)**
```
symbol number: bits # rest -> number ; // A binary number
symbol single: bit -> bits ; // A single bit
symbol many: bit # bits -> bits ; // More than one bit
symbol zero: -> bit ; // The zero bit
symbol one: -> bit ; // The non-zero bit
symbol integer: -> rest ; // An integer number
symbol rational: bits -> rest ; // A rational number
```
