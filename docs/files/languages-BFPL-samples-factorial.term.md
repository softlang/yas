# File _languages/BFPL/samples/factorial.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/factorial.term)**
```
[ (factorial, ([inttype],inttype),[x],if(binary(eq,arg(x),intconst(0)),intconst(1),binary(mul,arg(x),apply(factorial,[binary(sub,arg(x),intconst(1))]))))],apply(factorial,[intconst(5)]).
```

## Languages
* [BFPL](../languages/BFPL.md) (ok(bfpl(term)))
* [BFPL](../languages/BFPL.md) (bfpl(term))

## References
* elementOf('languages/BFPL/samples/factorial.term',ok(bfpl(term)))
* mapsTo(bigstep,['languages/BFPL/samples/factorial.term'],['languages/BFPL/samples/factorial.value'])
* mapsTo(smallstep,['languages/BFPL/samples/factorial.term'],['languages/BFPL/samples/factorial.normal'])
* mapsTo(denotational,['languages/BFPL/samples/factorial.term'],['languages/BFPL/samples/factorial.value'])
* elementOf('languages/BFPL/samples/factorial.term',bfpl(term))
* mapsTo(parse,['languages/BFPL/samples/factorial.bfpl'],['languages/BFPL/samples/factorial.term'])
