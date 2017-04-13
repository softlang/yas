# File _languages/BNL/Prolog/bnlAcceptor.dcg_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/bnlAcceptor.dcg)**
```
% BEGIN ...
:- module(bnlAcceptor, []).
% END ...
number --> bits, rest.
bits --> bit.  
bits --> bit, bits.
bit --> ['0'].
bit --> ['1'].
rest --> [].
rest --> ['.'], bits.
```

## Languages
* [DCG](../languages/DCG.md) (dcg(prolog(text)))

## References
* elementOf('languages/BNL/Prolog/bnlAcceptor.dcg',dcg(prolog(text)))
