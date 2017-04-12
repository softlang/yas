# File _languages/EIPL/sample.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/sample.term)**
```
[var(x,intconst(0)),proc(p,assign(x,binary(add,var(x),var(x)))),proc(q,call(p))],scope(([var(x,intconst(5)),proc(p,assign(x,binary(add,var(x),intconst(1))))],seq(call(q),write(var(x))))).
```
