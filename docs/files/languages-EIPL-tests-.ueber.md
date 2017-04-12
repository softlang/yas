# File _languages/EIPL/tests/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/EIPL/tests/.ueber)**
```
[
  elementOf('div.eipl', eipl(text)),
  macro(ill_formed('var-clash.eipl')),
  macro(ill_formed('proc-clash.eipl')),
  macro(ill_formed('missing-var-dec.eipl')),
  macro(ill_formed('missing-proc-dec.eipl'))
].
```
