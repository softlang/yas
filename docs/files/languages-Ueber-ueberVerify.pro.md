# File _languages/Ueber/ueberVerify.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/ueberVerify.pro)**
```
% BEGIN ...
:- module(ueberVerify, []).
verify(_, language(_)).
verify(_, membership(_, _, _)).
verify(_, function(_, _, _, _, _)).
verify(_, equivalence(_, _, _)).
verify(_, normalization(_, _, _)).
...
```
