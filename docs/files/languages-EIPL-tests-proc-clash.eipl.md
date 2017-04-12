# File _languages/EIPL/tests/proc-clash.eipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/tests/proc-clash.eipl)**
```
begin
  proc p { }
  proc p { }
  ;
end
```

## Languages
* [EIPL](../languages/EIPL.md)

## References
* elementOf('languages/EIPL/tests/proc-clash.eipl',eipl(text))
* mapsTo(parse,['languages/EIPL/tests/proc-clash.eipl'],['languages/EIPL/tests/proc-clash.term'])
