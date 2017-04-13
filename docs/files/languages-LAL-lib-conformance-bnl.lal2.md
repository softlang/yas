# File _languages/LAL/lib/conformance/bnl.lal2_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/bnl.lal2)**
```
sort Text
sort BNL <= Text
sort BGL <= Text
constant bnlGrammar : BGL
relation conformsTo : Text # BGL
axiom {
 forall x <- Text.
  (x <- BNL) <=> conformsTo(x, bnlGrammar)
}
link BNL to 'https://github.com/softlang/yas/blob/master/languages/BNL'
link BGL to 'https://github.com/softlang/yas/blob/master/languages/BGL'
link bnlGrammar to 'https://github.com/softlang/yas/blob/master/languages/BGL/cs.bgl'
```

## Languages
* [LAL](../languages/LAL.md) (lal(text))

## References
* elementOf('languages/LAL/lib/conformance/bnl.lal2',lal(text))
* mapsTo(pp,['languages/LAL/lib/conformance/bnl.term2'],['languages/LAL/lib/conformance/bnl.lal2'])
* mapsTo(parse,['languages/LAL/lib/conformance/bnl.lal2'],['languages/LAL/lib/conformance/bnl.term2'])
