# File _languages/EGL/samples/ambiguity.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/samples/ambiguity.egl)**
```
[binary] expr : expr bop expr ;
[const] expr : integer ;
[add] bop : '+' ;
[mul] bop : '*' ;
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/EGL/samples/ambiguity.egl',egl(text))
* mapsTo(parse,['languages/EGL/samples/ambiguity.egl'],['languages/EGL/samples/ambiguity.term'])
