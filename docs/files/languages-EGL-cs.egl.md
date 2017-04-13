# File _languages/EGL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/cs.egl)**
```
grammar : {rule}* ;
rule : {'[' label ']'}? nonterminal ':' gsymbols ';' ;
gsymbols : {gsymbol}* ;
[t] gsymbol : terminal ;
[n] gsymbol : nonterminal ;
[star] gsymbol : '{' gsymbols '}' '*' ;
[plus] gsymbol : '{' gsymbols '}' '+' ;
[option] gsymbol : '{' gsymbols '}' '?' ;
[not] gsymbol : '{' gsymbols '}' '~' ;
label : name ;
terminal : qstring ;
nonterminal : name ;
```

## Languages
* [EGL](../languages/EGL.md) (egl(text))

## References
* elementOf('languages/EGL/cs.egl',egl(text))
* mapsTo(parse,['languages/EGL/cs.egl'],['languages/EGL/cs.term'])
