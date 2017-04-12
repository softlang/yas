# File _languages/EGTL/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EGTL/.ueber)**
```
[
  macro(eglSyntax(egtl)),
  macro(eslSyntax(egtl)),
  language(extension(egtl(term))),
  membership(extension(egtl(term)), egtlExtension:ok, []),
  function(interpret, [egtl(term), egl(term)], [egl(term)], egtlInterpret:interpret, [])
].
```
