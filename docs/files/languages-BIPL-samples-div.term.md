# File _languages/BIPL/samples/div.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/div.term)**
```
seq(assign(x,intconst(14)),seq(assign(y,intconst(4)),seq(assign(q,intconst(0)),seq(assign(r,var(x)),while(binary(geq,var(r),var(y)),seq(assign(r,binary(sub,var(r),var(y))),assign(q,binary(add,var(q),intconst(1))))))))).
```

## Languages
* [BIPL](../languages/BIPL.md) (bipl(term))

## References
* mapsTo(bigstep,['languages/BIPL/samples/div.term'],['languages/BIPL/Prolog/div.store'])
* mapsTo(smallstep,['languages/BIPL/samples/div.term'],['languages/BIPL/Prolog/div.store'])
* elementOf('languages/BIPL/samples/div.term',bipl(term))
* mapsTo(parse,['languages/BIPL/samples/div.bipl'],['languages/BIPL/samples/div.term'])
