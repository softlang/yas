# File _languages/BIPL/samples/abs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/abs.term)**
```
seq(assign(y,binary(add,binary(mul,var(x),var(x)),intconst(42))),if(binary(lt,var(y),intconst(0)),assign(y,unary(negate,var(y))),skip)).
```