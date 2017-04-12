# File _languages/EGL/samples/left-recursion.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/samples/left-recursion.egl)**
```
[add] expr : expr '+' expr ;
[const] expr : integer ;
```

## Languages
* [EGL](../languages/EGL.md)

## References
* elementOf('languages/EGL/samples/left-recursion.egl',egl(text))
* mapsTo(parse,['languages/EGL/samples/left-recursion.egl'],['languages/EGL/samples/left-recursion.term'])
