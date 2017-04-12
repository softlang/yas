# File _languages/EL/Prolog/qq/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/cs.egl)**
```
// ... // The EL rules
// BEGIN ...
[or] expr : bexpr { '||' expr }? ;
[and] bexpr : cexpr { '&&' bexpr }? ;
[lt] cexpr : aexpr { '<' aexpr }? ;
[leq] cexpr : aexpr { '<=' aexpr }? ;
[eq] cexpr : aexpr { '==' aexpr }? ;
...
```
