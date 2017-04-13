# File _languages/EFPL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EFPL/cs.egl)**
```
// Program = functions + main expression
program : { function }* main ;
function : { funsig }? fundef ;
funsig : name '::' texpr ;
fundef : name { name }* '=' expr ;
main : 'main' '=' 'print' '$' expr ;

...
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/EFPL/cs.egl',egl(text))
* mapsTo(parse,['languages/EFPL/cs.egl'],['languages/EFPL/cs.term'])
