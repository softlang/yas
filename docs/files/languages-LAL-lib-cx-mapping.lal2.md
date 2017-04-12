# File _languages/LAL/lib/cx/mapping.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/cx/mapping.lal2)**
```
sort Any1
sort L1 <= Any1
sort Any2
sort L2 <= Any2
relation consistent : L1 # L2
function mapping : L1 -> L2
axiom {
 forall a <- L1.
  forall b <- L2.
   mapping(a) = b => consistent(a, b)
}
```
