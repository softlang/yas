# File _languages/EL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/cs.egl)**
```
[or] expr : bexpr { '||' expr }? ;
[and] bexpr : cexpr { '&&' bexpr }? ;
[lt] cexpr : aexpr { '<' aexpr }? ;
[leq] cexpr : aexpr { '<=' aexpr }? ;
[eq] cexpr : aexpr { '==' aexpr }? ;
[geq] cexpr : aexpr { '>=' aexpr }? ;
[gt] cexpr : aexpr { '>' aexpr }? ;
...
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/EL/cs.egl',egl(text))
* mapsTo(parse,['languages/EL/cs.egl'],['languages/EL/cs.term'])
