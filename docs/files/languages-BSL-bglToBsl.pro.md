# File _languages/BSL/bglToBsl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BSL/bglToBsl.pro)**
```
% BEGIN ...
:- module(bglToBsl, []).

% END ...
% Convert a grammar to a signature
Rules ~> Profiles :- map(bglToBsl:(~>), Rules, Profiles).

...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/BSL/bglToBsl.pro',prolog(text))
