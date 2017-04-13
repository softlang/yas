# File _languages/MML/conformance/mml2pro.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/conformance/mml2pro.pro)**
```
% MML strings are Prolog atoms
mml2pro(N1, N2) :- N1 = string -> N2 = atom; N2 = N1.

```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/MML/conformance/mml2pro.pro',prolog(text))
