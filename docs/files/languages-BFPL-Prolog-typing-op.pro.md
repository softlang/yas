# File _languages/BFPL/Prolog/typing/op.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/Prolog/typing/op.pro)**
```
% BEGIN ...
:- module(bfplOp, []).
% END ...
% Operand types of operators
ok(add, inttype, inttype, inttype).
ok(sub, inttype, inttype, inttype).
ok(mul, inttype, inttype, inttype).
ok(eq, inttype, inttype, booltype).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BFPL/Prolog/typing/op.pro',prolog(text))
