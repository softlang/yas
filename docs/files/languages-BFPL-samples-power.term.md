# File _languages/BFPL/samples/power.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/samples/power.term)**
```
[ (power, ([inttype,inttype],inttype),[n,x],if(binary(eq,arg(n),intconst(0)),intconst(1),binary(mul,arg(x),apply(power,[binary(sub,arg(n),intconst(1)),arg(x)]))))],apply(power,[intconst(3),intconst(2)]).
```

## Languages
* [BFPL](../languages/BFPL.md) (ok(bfpl(term)))
* [BFPL](../languages/BFPL.md) (bfpl(term))

## References
* elementOf('languages/BFPL/samples/power.term',ok(bfpl(term)))
* mapsTo(bigstep,['languages/BFPL/samples/power.term'],['languages/BFPL/samples/power.value'])
* elementOf('languages/BFPL/samples/power.term',bfpl(term))
* mapsTo(parse,['languages/BFPL/samples/power.bfpl'],['languages/BFPL/samples/power.term'])
