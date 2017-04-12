# File _languages/PPL/as.esl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/PPL/as.esl)**
```
symbol empty : -> box ;
symbol text : string -> box ;
symbol integer : integer -> box ;
symbol hbox : box # box -> box ;
symbol hlist : box* -> box ;
symbol hseplist : box # box* -> box ;
symbol vbox : box # box -> box ;
symbol vlist : box* -> box ;
symbol indent : box -> box ;
```
