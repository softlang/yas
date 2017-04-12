# File _languages/EIPL/sample.eipl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/sample.eipl)**
```
begin
  var x = 0;
  proc p { x = x + x; }
  proc q { call p; }
  begin
    var x = 5;
    proc p { x = x + 1; }
    {
      call q;
      write x;
    }
  end
end
```