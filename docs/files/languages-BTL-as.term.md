# File _languages/BTL/as.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/as.term)**
```
[ (true,[],expr), (false,[],expr), (zero,[],expr), (succ,[expr],expr), (pred,[expr],expr), (iszero,[expr],expr), (if,[expr,expr,expr],expr)].
```

## Languages
* [BSL](../languages/BSL.md) (bsl(term))

## References
* elementOf('languages/BTL/as.term',bsl(term))
* mapsTo(parse,['languages/BTL/as.bsl'],['languages/BTL/as.term'])
* mapsTo(project,['languages/BTL/cs.term'],['languages/BTL/as.term'])
* membership(btl(term),bslTerm,['languages/BTL/as.term'])
