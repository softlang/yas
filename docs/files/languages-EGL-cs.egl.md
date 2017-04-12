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
