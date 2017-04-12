# File _languages/LAL/lib/membership.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/membership.lal)**
```
reuse language
constant pos, neg : Any // Candidate elements
axiom member { pos <- L } // A member
axiom notMember { ~ (neg <- L) } // A non-member
```
