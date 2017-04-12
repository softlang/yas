# File _languages/LAL/lib/conformance/bnl.lal_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lib/conformance/bnl.lal)**
```
reuse conformance [
     Any |-> Text, DefAny |-> Text,
     L |-> BNL, DefL |-> BGL, defL |-> bnlGrammar ]
link BNL to 'https://github.com/softlang/yas/blob/master/languages/BNL'
link BGL to 'https://github.com/softlang/yas/blob/master/languages/BGL'
link bnlGrammar to 'https://github.com/softlang/yas/blob/master/languages/BGL/cs.bgl'
```

## Languages
* [LAL](../languages/LAL.md)

## References
* elementOf('languages/LAL/lib/conformance/bnl.lal',lal(text))
* mapsTo(parse,['languages/LAL/lib/conformance/bnl.lal'],['languages/LAL/lib/conformance/bnl.term'])
