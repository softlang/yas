# File _languages/EIPL/tests/div.eipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/tests/div.eipl)**
```
begin
  // Sample operands for Euclidian division
  var x = 14;
  var y = 4;

  // Compute quotient q=3 and remainder r=2
  var q = 0;
  var r = x;

  while (r >= y) {
     r = r - y;
     q = q + 1; 
  }
end
```

## Languages
* [EIPL](../languages/EIPL.md)

## References
* elementOf('languages/EIPL/tests/div.eipl',eipl(text))
