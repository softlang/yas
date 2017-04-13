# File _languages/BIPL/samples/factorialV1.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/factorialV1.term)**
```
seq(assign(y,intconst(1)),seq(assign(i,intconst(1)),while(binary(leq,var(i),var(x)),seq(assign(y,binary(mul,var(y),var(i))),assign(i,binary(add,var(i),intconst(1))))))).
```

## Languages
* [BIPL](../languages/BIPL.md) (bipl(term))

## References
* elementOf('languages/BIPL/samples/factorialV1.term',bipl(term))
* mapsTo(parse,['languages/BIPL/samples/factorialV1.bipl'],['languages/BIPL/samples/factorialV1.term'])
