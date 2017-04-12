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
