# File _languages/BFPL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BFPL/cs.egl)**
```
// Program = functions + main expression
program : { function }* main ;
function : funsig fundef ;
funsig : name '::' funtype ;
fundef : name { name }* '=' expr ;
funtype : simpletype { '->' simpletype }* ;
main : 'main' '=' 'print' '$' expr ;
...
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/BFPL/cs.egl',egl(text))
* mapsTo(parse,['languages/BFPL/cs.egl'],['languages/BFPL/cs.term'])
