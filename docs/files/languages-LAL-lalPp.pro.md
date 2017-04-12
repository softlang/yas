# File _languages/LAL/lalPp.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalPp.pro)**
```
:- module(lalPp, []).

pp(Ds, T) :-
    Ds => Bs,
    pplRender:render(vlist(Bs), T).

% Lists of declarations
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/LAL/lalPp.pro',prolog(text))
