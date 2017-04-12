# File _samples/obsolete/figure/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/figure/cs.egl)**
```
figure : {element ';'}* ;
[line] element : 'line' 'from' ':' point ',' 'to' ':' point ;
[circle ] element : 'circle' 'origin' ':' point ',' 'radius' ':' integer ;
point : '(' integer ',' integer ')' ;
```
