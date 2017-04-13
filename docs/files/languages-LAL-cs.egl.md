# File _languages/LAL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/LAL/cs.egl)**
```
// Megamodels
model : { decl }* ;

// Declarations
[reuse] decl : 'reuse' mname { substs }? ;
mname : name { '.' name }* ;
substs : '[' subst { ',' subst }* ']' ;
...
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/LAL/cs.egl',egl(text))
* mapsTo(parse,['languages/LAL/cs.egl'],['languages/LAL/cs.term'])
