# File _languages/Ueber/macros/fxy.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/fxy.pro)**
```
fxy(Fun,FX,LX,FY,LY) :-
  ueber([
    elementOf(FX, LX),
    elementOf(FY, LY),
    mapsTo(Fun, [FX], [FY]) ]).
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/macros/fxy.pro',prolog(text))
