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
