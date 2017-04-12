# File _languages/EGTL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/cs.egl)**
```
[sequ] trafos : { trafo }* ;
[renameT] trafo : 'rename' terminal 'to' terminal ';' ;
[renameN] trafo : 'rename' nonterminal 'to' nonterminal ';' ;
[generalize] trafo : 'generalize' rule 'to' rule ;
[specialize] trafo : 'specialize' rule 'to' rule ;
[add] trafo : 'add' rule ;
[remove] trafo : 'remove' rule ;
...
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/EGTL/cs.egl',egl(text))
* mapsTo(parse,['languages/EGTL/cs.egl'],['languages/EGTL/cs.term'])
