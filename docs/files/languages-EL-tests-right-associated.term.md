# File _languages/EL/tests/right-associated.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/tests/right-associated.term)**
```
binary(mul,var(a),binary(mul,var(b),binary(mul,var(c),var(d)))).
```

## Languages
* [EL](../languages/EL.md)

## References
* elementOf('languages/EL/tests/right-associated.term',el(term))
* mapsTo(parse,['languages/EL/tests/right-associated.el'],['languages/EL/tests/right-associated.term'])
* mapsTo(innermost,['languages/EL/tests/left-associated.term'],['languages/EL/tests/right-associated.term'])
