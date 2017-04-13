# File _languages/BTL/Prolog/btlValues.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BTL/Prolog/btlValues.pro)**
```
% Boolean values
isBool(true).
isBool(false).

% Natural numbers
isNat(zero).
isNat(succ(T)) :- isNat(T).

% Values
isValue(T) :- isBool(T).
isValue(T) :- isNat(T).
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/BTL/Prolog/btlValues.pro',prolog(text))
