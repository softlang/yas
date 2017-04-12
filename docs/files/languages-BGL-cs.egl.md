# File _languages/BGL/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/cs.egl)**
```
grammar : {rule}* ;
rule : '[' label ']' nonterminal ':' gsymbols ';' ;
gsymbols : {gsymbol}* ;
[t] gsymbol : terminal ;
[n] gsymbol : nonterminal ;
label : name ;
terminal : qstring ;
nonterminal : name ;
```
