# File _languages/LAL/lib/conformance.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance.lal2)**
```
sort Any
sort L <= Any
sort DefAny
sort DefL <= DefAny
constant defL : DefL
relation conformsTo : Any # DefL
axiom {
 forall x <- Any.
  (x <- L) <=> conformsTo(x, defL)
}
```
