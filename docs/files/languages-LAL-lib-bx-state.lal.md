# File _languages/LAL/lib/bx/state.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/bx/state.lal)**
```
reuse cx.mapping [ mapping |-> get ]
function get : L1 -> L2
function put : L1 # L2 ~> L1
axiom GetPut { forall s <- L1.
  put(s, get(s)) = s }
axiom PutGet { forall s1, s2 <- L1. forall v <- L2.
  put(s1, v) = s2 => get(s2) = v }
```
