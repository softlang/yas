# File _languages/LAL/lib/membership.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/membership.lal2)**
```
sort Any
sort L <= Any
constant pos : Any
constant neg : Any
axiom member {
 pos <- L
}
axiom notMember {
 ~ (neg <- L)
}
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/membership.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/membership.term2'],['languages/LAL/lib/membership.lal2'])
* mapsTo(parse,['languages/LAL/lib/membership.lal2'],['languages/LAL/lib/membership.term2'])
