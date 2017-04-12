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
