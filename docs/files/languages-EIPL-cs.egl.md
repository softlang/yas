# File _languages/EIPL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/cs.egl)**
```
program : scope ;

// Scopes
scope : 'begin' { decl }* stmt 'end' ;

// Declarations
[var] decl : 'var' name '=' expr ';' ;
...
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/EIPL/cs.egl',egl(text))
* mapsTo(parse,['languages/EIPL/cs.egl'],['languages/EIPL/cs.term'])
