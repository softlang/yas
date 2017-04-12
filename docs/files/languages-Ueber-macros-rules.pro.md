# File _languages/Ueber/macros/rules.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/Ueber/macros/rules.pro)**
```
% Derive syntax of RL instance from a given syntax
rl(Dir) :-
  atom_concat(Dir, '/cs.term', Cs), 
  atom_concat(Dir, '/ls.term', Ls), 
  atom_concat(Dir, '/as.term', As), 
  ueber(mapsTo(rlDerive,
    [Cs, Ls, As],
...
```

## Languages
* [Prolog](../languages/Prolog.md)

## References
* elementOf('languages/Ueber/macros/rules.pro',prolog(text))
