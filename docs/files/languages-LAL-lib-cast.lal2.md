# File _languages/LAL/lib/cast.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cast.lal2)**
```
sort Any
sort L <= Any
function cast : Any ~> L
axiom castOk {
 forall e <- L.
  cast(e) = e
}
axiom castFail {
 forall e1 <- Any.
  (~ (e1 <- L)) => (~ (exists e2 <- L.
                        cast(e1) = e2))
}
```
