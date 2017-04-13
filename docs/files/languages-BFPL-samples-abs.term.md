# File _languages/BFPL/samples/abs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/abs.term)**
```
[ (abs, ([inttype],inttype),[x],if(binary(lt,arg(x),intconst(0)),unary(negate,arg(x)),arg(x)))],apply(abs,[unary(negate,intconst(42))]).
```

## Languages
* [BFPL](../languages/BFPL.md) (bfpl(term))

## References
* elementOf('languages/BFPL/samples/abs.term',bfpl(term))
* mapsTo(parse,['languages/BFPL/samples/abs.bfpl'],['languages/BFPL/samples/abs.term'])
