# File _languages/BFPL/samples/abs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/abs.term)**
```
[ (abs, ([inttype],inttype),[x],if(binary(lt,arg(x),intconst(0)),unary(negate,arg(x)),arg(x)))],apply(abs,[unary(negate,intconst(42))]).
```
