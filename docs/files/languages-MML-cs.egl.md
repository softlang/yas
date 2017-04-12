# File _languages/MML/cs.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/MML/cs.egl)**
```
metamodel : { classifier }* ;
[datatype] classifier : 'datatype' name ';' ;
[class] classifier : abstract 'class' name super members ;
super : { 'extends' name }? ;
[abstract] abstract : 'abstract' ;
[concrete] abstract : ;
members : '{' { member }* '}' ;
...
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/MML/cs.egl',egl(text))
* mapsTo(parse,['languages/MML/cs.egl'],['languages/MML/cs.term'])
