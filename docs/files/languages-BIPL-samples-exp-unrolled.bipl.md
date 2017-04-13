# File _languages/BIPL/samples/exp-unrolled.bipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BIPL/samples/exp-unrolled.bipl)**
```
{
  r = 1;
  r = r * x;
  n = n - 1; 
  r = r * x;
  n = n - 1; 
  r = r * x;
  n = n - 1; 
}
```

## Languages
* [BIPL](../languages/BIPL.md) (bipl(text))

## References
* elementOf('languages/BIPL/samples/exp-unrolled.bipl',bipl(text))
* mapsTo(parse,['languages/BIPL/samples/exp-unrolled.bipl'],['languages/BIPL/samples/exp-unrolled.term'])
