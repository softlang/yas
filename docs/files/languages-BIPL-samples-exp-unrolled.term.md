# File _languages/BIPL/samples/exp-unrolled.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/exp-unrolled.term)**
```
seq(assign(r,intconst(1)),seq(assign(r,binary(mul,var(r),var(x))),seq(assign(n,binary(sub,var(n),intconst(1))),seq(assign(r,binary(mul,var(r),var(x))),seq(assign(n,binary(sub,var(n),intconst(1))),seq(assign(r,binary(mul,var(r),var(x))),assign(n,binary(sub,var(n),intconst(1))))))))).
```
