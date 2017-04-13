# File _languages/LAL/lalReuse.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/lalReuse.pro)**
```
% BEGIN ...
:- module(lalReuse, []).
% END ...
% Case for megamodels (lists of declarations)
inline(Ds1, Ds2) :-
    map(lalReuse:inline, Ds1, Dss),
    concat(Dss, Ds2).
...
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/LAL/lalReuse.pro',prolog(text))
