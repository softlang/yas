# File _languages/BIPL/samples/factorialV1.bipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/factorialV1.bipl)**
```
// BEGIN ...
{
// END ...
  // Assume x to be positive
  y = 1;
  i = 1;
  while (i <= x) {
    y = y * i;
    i = i + 1;
  }
// BEGIN ...
}
// END ...
```

## Languages
* [BIPL](../languages/BIPL.md)

## References
* elementOf('languages/BIPL/samples/factorialV1.bipl',bipl(text))
* mapsTo(parse,['languages/BIPL/samples/factorialV1.bipl'],['languages/BIPL/samples/factorialV1.term'])
