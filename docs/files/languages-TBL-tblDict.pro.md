# File _languages/TBL/tblDict.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/TBL/tblDict.pro)**
```
% BEGIN ...
% Map terms to dictionaries
:- module(tblDict, []).

% END ...
W1 => {class:world, persons:W2} :- map(tblDict:(=>), W1, W2).
(N, B) => {class:person, name:N, buddy:B}.
```

## Languages
* [Prolog](../languages/Prolog.md) (prolog(text))

## References
* elementOf('languages/TBL/tblDict.pro',prolog(text))
