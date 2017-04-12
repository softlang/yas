# File _languages/BIPL/samples/addmul.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/addmul.term)**
```
seq(assign(x,binary(add,intconst(1),binary(mul,intconst(2),intconst(3)))),assign(x,binary(add,binary(mul,intconst(1),intconst(2)),intconst(3)))).
```

## Languages
* [BIPL](../languages/BIPL.md)

## References
* elementOf('languages/BIPL/samples/addmul.term',bipl(term))
* mapsTo(parse,['languages/BIPL/samples/addmul.bipl'],['languages/BIPL/samples/addmul.term'])
