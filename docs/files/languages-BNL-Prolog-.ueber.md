# File _languages/BNL/Prolog/.ueber_
**[GitHub](https://github.com/softlang/yas/blob/master/languages/BNL/Prolog/.ueber)**
```
[
  % DCG-based acceptor
  membership(bnl(tokens(term)), dcgAcceptor(bnlAcceptor:number), []),

  % Languages for results
  language(bnl(value(term))),
  membership(bnl(value(term)), number, []),
...
```
