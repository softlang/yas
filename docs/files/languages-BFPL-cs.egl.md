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
