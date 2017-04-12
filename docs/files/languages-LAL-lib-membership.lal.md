# File _languages/LAL/lib/membership.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/membership.lal)**
```
reuse language
constant pos, neg : Any // Candidate elements
axiom member { pos <- L } // A member
axiom notMember { ~ (neg <- L) } // A non-member
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/membership.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/membership.lal'],['languages/LAL/lib/membership.term'])
