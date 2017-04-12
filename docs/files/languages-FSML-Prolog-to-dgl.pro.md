# File _languages/FSML/Prolog/to-dgl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/FSML/Prolog/to-dgl.pro)**
```
% Map FSM to DGL-like graph
fsmToDgl(Ss, (Ns, Es)) :-
  map(fsmStateToDgl, Ss, NEs),
  unzip(NEs, Ns, Ess),
  concat(Ess, Es).

% Map state of FSM
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/FSML/Prolog/to-dgl.pro',prolog(text))
