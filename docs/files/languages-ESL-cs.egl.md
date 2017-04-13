# File _languages/ESL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/ESL/cs.egl)**
```
signature : { decl ';' }* ;
[type] decl : 'type' name '=' typeexprs ;
[symbol] decl : 'symbol' name ':' { typeexprs }? '->' name ;
typeexprs : typeexpr { '#' typeexpr }* ;
typeexpr : factor cardinality ;
[boolean] factor : 'boolean' ;
[integer] factor : 'integer' ;
...
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/ESL/cs.egl',egl(text))
* mapsTo(parse,['languages/ESL/cs.egl'],['languages/ESL/cs.term'])
