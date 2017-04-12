# File _languages/BIPL/samples/exp-sliced.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/exp-sliced.term)**
```
seq(assign(r,intconst(1)),seq(assign(r,binary(mul,var(r),var(x))),seq(assign(r,binary(mul,var(r),var(x))),assign(r,binary(mul,var(r),var(x)))))).
```

## Languages
* [BIPL](../languages/BIPL.md)

## References
* elementOf('languages/BIPL/samples/exp-sliced.term',bipl(term))
* mapsTo(parse,['languages/BIPL/samples/exp-sliced.bipl'],['languages/BIPL/samples/exp-sliced.term'])
