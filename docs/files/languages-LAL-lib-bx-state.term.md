# File _languages/LAL/lib/bx/state.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/bx/state.term)**
```
[reuse([cx,mapping],[ (mapping,get)]),function(get,[ref('L1')],total,ref('L2')),function(put,[ref('L1'),ref('L2')],partial,ref('L1')),axiom(['GetPut'],forall(bindv(s),ref('L1'),eq(funapp(put,[var(s),funapp(get,[var(s)])]),var(s)))),axiom(['PutGet'],forall(bindv(s1),ref('L1'),forall(bindv(s2),ref('L1'),forall(bindv(v),ref('L2'),ifthen(eq(funapp(put,[var(s1),var(v)]),var(s2)),eq(funapp(get,[var(s2)]),var(v)))))))].
```

## Languages
* [LAL](../languages/LAL.md) (lal(term))

## References
* elementOf('languages/LAL/lib/bx/state.term',lal(term))
* mapsTo(parse,['languages/LAL/lib/bx/state.lal'],['languages/LAL/lib/bx/state.term'])
* mapsTo(deps,['languages/LAL/lib/bx/state.term'],['languages/LAL/lib/bx/state.deps'])
* mapsTo(transform,['languages/LAL/lib/bx/state.term'],['languages/LAL/lib/bx/state.term2'])
