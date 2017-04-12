# File _languages/BNL/cs.term_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/cs.term)**
```
[
  (number,number,[n(bits),n(rest)]),
  (single,bits,[n(bit)]),
  (many,bits,[n(bit),n(bits)]),
  (zero,bit,[t('0')]),
  (one,bit,[t('1')]),
  (integer,rest,[]),
  (rational,rest,[t('.'),n(bits)])
].
```
