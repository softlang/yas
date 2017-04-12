# File _samples/obsolete/expr/cs.bgl_
**[GitHub](https://github.com/softlang/yas/blob/master/samples/obsolete/expr/cs.bgl)**
```
[const] expr : nat ;
[add] expr : expr '+' expr ;
[zero] nat : 'zero' ;
[succ] nat : 'succ' '(' nat ')' ;
```

## Languages
* [BGL](../languages/BGL.md)

## References
* elementOf('samples/obsolete/expr/cs.bgl',bgl(text))
* mapsTo(parse,['samples/obsolete/expr/cs.bgl'],['samples/obsolete/expr/cs.term'])
