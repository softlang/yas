# File _languages/EGTL/egtlExtension.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/egtlExtension.pro)**
```
:- module(egtlExtension, []).

ok(sequ(Ts)) :- map(egtlExtension:ok, Ts).
ok(generalize(_, _)).
ok(add(_)).
```
