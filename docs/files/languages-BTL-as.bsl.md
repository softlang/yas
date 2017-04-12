# File _languages/BTL/as.bsl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/as.bsl)**
```
symbol true : -> expr ; // The Boolean "true"
symbol false : -> expr ; // The Boolean "false"
symbol zero : -> expr ; // The natural number zero
symbol succ : expr -> expr ; // Successor of a natural number
symbol pred : expr -> expr ; // Predecessor of a natural number
symbol iszero : expr -> expr ; // Test for a number to be zero
symbol if : expr # expr # expr -> expr ; // Conditional
```

## Languages
* [BSL](../languages/BSL.md)

## References
* elementOf('languages/BTL/as.bsl',bsl(text))
* mapsTo(parse,['languages/BTL/as.bsl'],['languages/BTL/as.term'])
