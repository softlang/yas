# File _languages/LAL/lib/application.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/application.lal)**
```
reuse interpretation [ interpret |-> interpretTyped ]
function interpretUntyped : XL # Any1 ~> Any2
constant trafo : XL
axiom cast {
  forall x <- L1. forall y <- L2.
    interpretTyped(trafo, x) = y <=> interpretUntyped(trafo, x) = y }
axiom welltyped {
  forall x <- L1. forall y <- Any2.
    interpretUntyped(trafo, x) = y => y <- L2 } 
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/application.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/application.lal'],['languages/LAL/lib/application.term'])
