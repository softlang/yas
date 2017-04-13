# File _languages/BIPL/samples/factorialV2.bipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/factorialV2.bipl)**
```
// BEGIN ...
{
// END ...
  // Assume x to be positive
  y = 1;
  while (x >= 2) {
    y = y * x;
    x = x - 1;
  }
// BEGIN ...
}
// END ...
```

## Languages
* [BIPL](../languages/BIPL.md) (bipl(text))

## References
* elementOf('languages/BIPL/samples/factorialV2.bipl',bipl(text))
* mapsTo(parse,['languages/BIPL/samples/factorialV2.bipl'],['languages/BIPL/samples/factorialV2.term'])
