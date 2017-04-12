# File _languages/BIPL/samples/factorialV2.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/factorialV2.term)**
```
seq(assign(y,intconst(1)),while(binary(geq,var(x),intconst(2)),seq(assign(y,binary(mul,var(y),var(x))),assign(x,binary(sub,var(x),intconst(1)))))).
```
