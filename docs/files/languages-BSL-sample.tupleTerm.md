# File _languages/BSL/sample.tupleTerm_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/sample.tupleTerm)**
```
% A simple expression term "0 + 1"
( add, 
  [
    (const, [(zero, [])]),
    (const, [(succ, [(zero, [])])])
  ]
).
```
