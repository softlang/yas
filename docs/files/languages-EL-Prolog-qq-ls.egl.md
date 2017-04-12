# File _languages/EL/Prolog/qq/ls.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EL/Prolog/qq/ls.egl)**
```
// ... // The EL rules
// BEGIN ...
metavar : '$' upper { csym }* ;
identifier : { lower }+ ;
integer : { digit }+ ;
layout : { space }+ ;
// END ...
metavar : '$' upper { csym }* ; // Regular metavariables
metavar : '$' '_' { csym }* ; // Anonymous metavariables
```
