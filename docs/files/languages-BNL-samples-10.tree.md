# File _languages/BNL/samples/10.tree_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/samples/10.tree)**
```
fork(
  (number,number,[n(bits),n(rest)]), % rule
  [ % list of branches
    fork( % 1st branch
      (many,bits,[n(bit),n(bits)]), % rule
      [ % list of branches
        fork( % 1st branch
...
```
