# File _languages/BIPL/samples/div.bipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/div.bipl)**
```
{
  // Sample operands for Euclidian division
  x = 14;
  y = 4; 

  // Compute quotient q=3 and remainder r=2
  q = 0;
  r = x;
  while (r >= y) {
     r = r - y;
     q = q + 1; 
  }
}
```

## Languages
* [BIPL](../languages/BIPL.md)

## References
* elementOf('languages/BIPL/samples/div.bipl',bipl(text))
* mapsTo(parse,['languages/BIPL/samples/div.bipl'],['languages/BIPL/samples/div.term'])
