# File _languages/EL/tests/left-associated.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/tests/left-associated.term)**
```
binary(mul,binary(mul,binary(mul,var(a),var(b)),var(c)),var(d)).
```

## Languages
* [EL](../languages/EL.md) (el(term))

## References
* elementOf('languages/EL/tests/left-associated.term',el(term))
* mapsTo(parse,['languages/EL/tests/left-associated.el'],['languages/EL/tests/left-associated.term'])
* mapsTo(fullbu,['languages/EL/tests/left-associated.term'],['languages/EL/tests/mix-associated.term'])
* mapsTo(innermost,['languages/EL/tests/left-associated.term'],['languages/EL/tests/right-associated.term'])
