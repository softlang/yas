# File _languages/EGL/samples/ambiguity.egl_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGL/samples/ambiguity.egl)**
```
[binary] expr : expr bop expr ;
[const] expr : integer ;
[add] bop : '+' ;
[mul] bop : '*' ;
```
