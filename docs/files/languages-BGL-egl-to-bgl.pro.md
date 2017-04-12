# File _languages/BGL/egl-to-bgl.pro_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BGL/egl-to-bgl.pro)**
```
/*
Map more complex EGL grammar notation to BGL
*/

eglToBgl(Rs1, Rs2) :-
  map(eglToBglRule, Rs1, Rs2).

...
```
