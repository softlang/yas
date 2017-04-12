# File _languages/EIPL/tests/var-clash.eipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/tests/var-clash.eipl)**
```
begin
  var x = 0;
  var x = 0;
  ;
end
```

## Languages
* [EIPL](../languages/EIPL.md)

## References
* elementOf('languages/EIPL/tests/var-clash.eipl',eipl(text))
* mapsTo(parse,['languages/EIPL/tests/var-clash.eipl'],['languages/EIPL/tests/var-clash.term'])
