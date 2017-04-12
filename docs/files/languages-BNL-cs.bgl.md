# File _languages/BNL/cs.bgl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/cs.bgl)**
```
[number] number : bits rest ; // A binary number 
[single] bits : bit ; // A single bit
[many] bits : bit bits ; // More than one bit
[zero] bit : '0' ; // The zero bit
[one] bit : '1' ;  // The non-zero bit
[integer] rest : ; // An integer number
[rational] rest : '.' bits ; // A rational number
```