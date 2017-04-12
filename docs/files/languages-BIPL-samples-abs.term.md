# File _languages/BIPL/samples/abs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/abs.term)**
```
seq(assign(y,binary(add,binary(mul,var(x),var(x)),intconst(42))),if(binary(lt,var(y),intconst(0)),assign(y,unary(negate,var(y))),skip)).
```

## Languages
* [BIPL](../languages/BIPL.md)

## References
* elementOf('languages/BIPL/samples/abs.term',bipl(term))
* mapsTo(parse,['languages/BIPL/samples/abs.bipl'],['languages/BIPL/samples/abs.term'])
