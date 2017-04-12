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
