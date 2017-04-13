# File _languages/EIPL/sample.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/sample.term)**
```
[var(x,intconst(0)),proc(p,assign(x,binary(add,var(x),var(x)))),proc(q,call(p))],scope(([var(x,intconst(5)),proc(p,assign(x,binary(add,var(x),intconst(1))))],seq(call(q),write(var(x))))).
```

## Languages
* [EIPL](../languages/EIPL.md) (eipl(term))
* [EIPL](../languages/EIPL.md) (ok(eipl(term)))

## References
* elementOf('languages/EIPL/sample.term',eipl(term))
* mapsTo(parse,['languages/EIPL/sample.eipl'],['languages/EIPL/sample.term'])
* elementOf('languages/EIPL/sample.term',ok(eipl(term)))
* mapsTo(executeDynamic,['languages/EIPL/sample.term'],['languages/EIPL/Prolog/dynamic.output'])
* mapsTo(executeMixed,['languages/EIPL/sample.term'],['languages/EIPL/Prolog/mixed.output'])
* mapsTo(executeStatic,['languages/EIPL/sample.term'],['languages/EIPL/Prolog/static.output'])
